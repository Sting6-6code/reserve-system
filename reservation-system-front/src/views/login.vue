<template>
  <div class="loginVideo">
    <video
        src="../assets/video/bgvideo.mp4"
        playsInline
        autoPlay
        muted
        :loop="true"
        :controls="false"
        preload="auto"
    />
    <div id="loginBox">
      <!-- 登录框 -->
      <div class="container">
        <div class="drop">
          <div class="content">
                <el-form ref="loginRef" :model="loginForm" :rules="loginRules" class="login-form">
                  <h3 class="title">预约管理平台</h3>
                  <el-form-item prop="username">
                    <el-input
                      v-model="loginForm.username"
                      type="text"
                      size="large"
                      auto-complete="off"
                      placeholder="账号"
                    >
                      <template #prefix><svg-icon icon-class="user" class="el-input__icon input-icon" /></template>
                    </el-input>
                  </el-form-item>
                  <el-form-item prop="password">
                    <el-input
                      v-model="loginForm.password"
                      type="password"
                      size="large"
                      auto-complete="off"
                      placeholder="密码"
                      @keyup.enter="handleLogin"
                    >
                      <template #prefix><svg-icon icon-class="password" class="el-input__icon input-icon" /></template>
                    </el-input>
                  </el-form-item>
                  <el-form-item prop="code" v-if="captchaEnabled">
                    <el-input
                      v-model="loginForm.code"
                      size="large"
                      auto-complete="off"
                      placeholder="验证码"
                      style="width: 63%"
                      @keyup.enter="handleLogin"
                    >
                      <template #prefix><svg-icon icon-class="validCode" class="el-input__icon input-icon" /></template>
                    </el-input>
                    <div class="login-code">
                      <img :src="codeUrl" @click="getCode" class="login-code-img"/>
                    </div>
                  </el-form-item>
                  <el-checkbox v-model="loginForm.rememberMe" style="margin:0px 0px 0px 0px;">记住密码</el-checkbox>
                  <el-form-item style="width:100%;">
                    <el-button
                      :loading="loading"
                      size="large"
                      type="primary"
                      style="width:60%;margin-left: 20%;border-radius: 36px;"
                      @click.prevent="handleLogin"
                    >
                      <span v-if="!loading">登 录</span>
                      <span v-else>登 录 中...</span>
                    </el-button>
                  </el-form-item>
                  <div style="margin: 0 15px;display: flex;justify-content: space-around;align-items: center" v-if="register">
                    <input
                        class="register"
                        type="button"
                        value="立即注册"
                        @click="toRegister"
                    />
                  </div>
                </el-form>

          </div>
        </div>
      </div>
    </div>


    <div id="registerBox">
      <!-- 注册框 -->
      <div class="container">
        <div class="drop">
          <div class="content">
<!--            <h2 :style="{ color: '#3399ff' }">预约系统</h2>-->
            <el-form ref="registerRef" :model="registerForm" :rules="registerRules" class="login-form">
              <h3 class="title">预约管理平台</h3>
              <el-form-item prop="username">
                <el-input
                    v-model="registerForm.username"
                    type="text"
                    size="large"
                    auto-complete="off"
                    placeholder="账号"
                >
                  <template #prefix><svg-icon icon-class="user" class="el-input__icon input-icon" /></template>
                </el-input>
              </el-form-item>
              <el-form-item prop="password">
                <el-input
                    v-model="registerForm.password"
                    type="password"
                    size="large"
                    auto-complete="off"
                    placeholder="密码"
                    @keyup.enter="handleRegister"
                >
                  <template #prefix><svg-icon icon-class="password" class="el-input__icon input-icon" /></template>
                </el-input>
              </el-form-item>
              <el-form-item prop="confirmPassword">
                <el-input
                    v-model="registerForm.confirmPassword"
                    type="password"
                    size="large"
                    auto-complete="off"
                    placeholder="确认密码"
                    @keyup.enter="handleRegister"
                >
                  <template #prefix><svg-icon icon-class="password" class="el-input__icon input-icon" /></template>
                </el-input>
              </el-form-item>
              <el-form-item prop="code" v-if="captchaEnabled">
                <el-input
                    size="large"
                    v-model="registerForm.code"
                    auto-complete="off"
                    placeholder="验证码"
                    style="width: 63%"
                    @keyup.enter="handleRegister"
                >
                  <template #prefix><svg-icon icon-class="validCode" class="el-input__icon input-icon" /></template>
                </el-input>
                <div class="login-code">
                  <img :src="codeUrl" @click="getCode('register')" class="login-code-img"/>
                </div>
              </el-form-item>
              <el-form-item style="width:100%;">
                <el-button
                    :loading="loading"
                    size="large"
                    type="primary"
                    style="width:60%;margin-left: 20%;border-radius: 36px;"
                    @click.prevent="handleRegister"
                >
                  <span v-if="!loading">注 册</span>
                  <span v-else>注 册 中...</span>
                </el-button>
              </el-form-item>
              <div :style="{ margin: '0 auto' }">
                <input
                    class="register"
                    type="button"
                    value="去登录"
                    @click="toLogin"
                />
              </div>
            </el-form>
          </div>
        </div>
      </div>
    </div>


  </div>
</template>

<script setup>
import {ElMessage, ElMessageBox, ElNotification} from "element-plus";
import { onMounted, ref,reactive,watch } from "vue";
import { useRouter } from "vue-router";

import { getCodeImg,register as registerApi } from "@/api/login";
import Cookies from "js-cookie";
import { encrypt, decrypt } from "@/utils/jsencrypt";
import useUserStore from '@/store/modules/user'

const userStore = useUserStore()
const router = useRouter();
const { proxy } = getCurrentInstance();

const loginForm = ref({
  username: "admin",
  password: "admin123",
  rememberMe: false,
  code: "",
  uuid: ""
});

const loginRules = {
  username: [{ required: true, trigger: "blur", message: "请输入您的账号" }],
  password: [{ required: true, trigger: "blur", message: "请输入您的密码" }],
  code: [{ required: true, trigger: "change", message: "请输入验证码" }]
};

const registerForm = ref({
  username: "",
  password: "",
  confirmPassword: "",
  code: "",
  uuid: ""
});

const equalToPassword = (rule, value, callback) => {
  if (registerForm.value.password !== value) {
    callback(new Error("两次输入的密码不一致"));
  } else {
    callback();
  }
};

const registerRules = {
  username: [
    { required: true, trigger: "blur", message: "请输入您的账号" },
    { min: 2, max: 20, message: "用户账号长度必须介于 2 和 20 之间", trigger: "blur" }
  ],
  password: [
    { required: true, trigger: "blur", message: "请输入您的密码" },
    { min: 5, max: 20, message: "用户密码长度必须介于 5 和 20 之间", trigger: "blur" }
  ],
  confirmPassword: [
    { required: true, trigger: "blur", message: "请再次输入您的密码" },
    { required: true, validator: equalToPassword, trigger: "blur" }
  ],
  code: [{ required: true, trigger: "change", message: "请输入验证码" }]
};



const codeUrl = ref("");
const loading = ref(false);
// 验证码开关
const captchaEnabled = ref(true);
// 注册开关
const register = ref(true);
const redirect = ref(undefined);

watch(router.currentRoute, (newRoute) => {
  console.log('route',router.currentRoute,newRoute)
  redirect.value = newRoute.query && newRoute.query.redirect;
}, { immediate: true });

function handleLogin() {
  let failValidMessage=''
  proxy.$refs.loginRef.validate((valid,content) => {
    if (valid) {
      loading.value = true;
      // 勾选了需要记住密码设置在 cookie 中设置记住用户名和密码
      if (loginForm.value.rememberMe) {
        Cookies.set("username", loginForm.value.username, { expires: 30 });
        Cookies.set("password", encrypt(loginForm.value.password), { expires: 30 });
        Cookies.set("rememberMe", loginForm.value.rememberMe, { expires: 30 });
      } else {
        // 否则移除
        Cookies.remove("username");
        Cookies.remove("password");
        Cookies.remove("rememberMe");
      }
      // 调用action的登录方法
      userStore.login(loginForm.value).then(() => {
        const query = router.currentRoute._value.query
        const otherQueryParams = Object.keys(query).reduce((acc, cur) => {
          if (cur !== "redirect") {
            acc[cur] = query[cur];
          }
          return acc;
        }, {});
        console.log('登录成功后:',router.currentRoute._value.query,redirect.value)
        router.push({ path: redirect.value || "/", query: otherQueryParams });
      }).catch((e) => {
        console.log('登录发生异常：',e)
        loading.value = false;
        // 重新获取验证码
        if (captchaEnabled.value) {
          getCode();
        }
      });
    }
  });
}

function handleRegister() {
  proxy.$refs.registerRef.validate(valid => {
    if (valid) {
      loading.value = true;
      registerApi(registerForm.value).then(res => {
        const username = registerForm.value.username;
        ElMessageBox.alert("<font color='red'>恭喜你，您的账号 " + username + " 注册成功！</font>", "系统提示", {
          dangerouslyUseHTMLString: true,
          type: "success",
        }).then(() => {
          loading.value = false;
          toLogin()
          // router.push("/login");
        }).catch(() => {});
      }).catch(() => {
        loading.value = false;
        if (captchaEnabled) {
          getCode('register');
        }
      });
    }
  });
}

function getCode(type) {
  getCodeImg().then(res => {
    captchaEnabled.value = res.captchaEnabled === undefined ? true : res.captchaEnabled;
    if (captchaEnabled.value) {
      codeUrl.value = "data:image/gif;base64," + res.img;
      if(type=='register'){
        registerForm.value.uuid = res.uuid;
      }else{
        loginForm.value.uuid = res.uuid;
      }

    }
  });
}

function getCookie() {
  const username = Cookies.get("username");
  const password = Cookies.get("password");
  const rememberMe = Cookies.get("rememberMe");
  loginForm.value = {
    username: username === undefined ? loginForm.value.username : username,
    password: password === undefined ? loginForm.value.password : decrypt(password),
    rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
  };
}

getCode();
getCookie();

// 去登录
function toLogin(){
  getCode();
  const loginBox=document.getElementById('loginBox')
  const registerBox=document.getElementById('registerBox')
  loginBox.style.zIndex='1'
  registerBox.style.zIndex='0'
  loginBox.style.top='50%'
  registerBox.style.top='-100vh'

}

// 去注册
function toRegister(){
  getCode('register');
  const loginBox=document.getElementById('loginBox')
  const registerBox=document.getElementById('registerBox')
  loginBox.style.zIndex='0'
  registerBox.style.zIndex='1'
  registerBox.style.top='50%'
  loginBox.style.top='-100vh'
}
</script>
<style lang='scss' scoped>
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 350px;
}
.title {
  margin: 0px auto 0px auto;
  text-align: center;
  color: #79bbff;
}
:deep(.el-input){
  --el-input-text-color: var(--el-text-color-regular);
  --el-input-border: transparent;
  --el-input-hover-border: var(--el-border-color-hover);
  --el-input-focus-border: var(--el-color-primary);
  --el-input-transparent-border: 0 0 0 1px transparent inset;
  --el-input-border-color: var(--el-border-color);
  --el-input-border-radius: 24px;
  --el-input-bg-color: transparent;
  --el-input-icon-color: var(--el-text-color-placeholder);
  --el-input-placeholder-color: var(--el-text-color-placeholder);
  --el-input-hover-border-color: var(--el-border-color-hover);
  --el-input-clear-hover-color: var(--el-text-color-secondary);
  --el-input-focus-border-color: var(--el-color-primary);
  --el-input-width: 100%;
  box-shadow: inset 2px 5px 10px rgba(0, 0, 0, 0.1), inset -2px -5px 10px rgba(255, 255, 255, 1), 15px 15px 10px rgba(0, 0, 0, 0.05), 15px 10px 15px rgba(0, 0, 0, 0.025);
}
.login-form {
  border-radius: 6px;
  padding: 0px 25px;
  :deep(.el-form-item--default) {
    margin-bottom: 0px;
  }
  .el-input {
    height: 40px;
    --el-input-bg-color: transparent;
    border-radius: 24px;
    box-shadow: inset 2px 5px 10px rgba(0, 0, 0, 0.1), inset -2px -5px 10px rgb(255, 255, 255), 15px 15px 10px rgba(0, 0, 0, 0.05), 15px 10px 15px rgba(0, 0, 0, 0.025);
    input {
      height: 36px;
    }
  }
  .input-icon {
    height: 35px;
    width: 14px;
    margin-left: 0px;
  }
}
.login-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}
.login-code {
  width: 33%;
  height: 40px;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
    width: 100%;
  }
}
.el-login-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}
.login-code-img {
  height: 40px;
  padding-left: 12px;
}
</style>
<style scoped>
.loginVideo {
  width: 100%;
  height: 100vh;
  overflow: hidden;
  position: relative;
}

/* 验证码样式 */
.canvascs {
  width: 96px;
  height: 100%;
  border-bottom-right-radius: 20px;
  border-top-right-radius: 20px;
  background: white;
  margin-left: 30px;
}

#yanzheng {
  display: flex;
  width: 130px;
  border-bottom-right-radius: 0px;
  border-top-right-radius: 0px;
}

#yanzheng div {
  width: 96px;
  /* background: pink; */
}

#yanzheng input {
  width: 100px;
}

video {
  height: 100%;
  width: 100%;
  object-fit: cover;
  object-position: center;
}

#loginBox {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1;
  transition: all 1.5s ease-in-out;
}

#registerBox {
  position: absolute;
  top: -100vh;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 0;
  transition: all 1.5s ease-in-out;

}

/* 登录框 */
.container .drop {
  transform: scale(1);
  position: relative;
  width: 375px;
  height: 375px;
  box-shadow: inset 20px 20px 20px rgba(0, 0, 0, 0.05),
  25px 35px 20px rgba(0, 0, 0, 0.05), 25px 30px 30px rgba(0, 0, 0, 0.05),
  inset -20px -20px 25px rgba(255, 255, 255, 0.9);
  transition: 0.5s;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
}


.container .drop:hover {
  border-radius: 10%;
}

.container .drop:hover .content h2  {
  font-size: 1.5em;
}

.container .drop::before {
  content: "";
  position: absolute;
  top: 50px;
  left: 85px;
  width: 35px;
  height: 35px;
  border-radius: 50%;
  background: #fff;
  opacity: 0.9;
}

.container .drop::after {
  content: "";
  position: absolute;
  top: 90px;
  left: 110px;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background: #fff;
  opacity: 0.9;
}

.container .drop .content {
  position: relative;
  display: flex;
  justify-content: center;
  /* align-items: center; */
  flex-direction: column;
  text-align: center;
  padding: 40px;
  gap: 15px;
}

.container .drop .content h2 {
  position: relative;
  color: #333;
  font-size: 1em;
  transition: all .5s;
}

.container .drop .content form {
  display: flex;
  flex-direction: column;
  gap: 20px;
  justify-content: center;
  /* align-items: center; */
}

.container .drop .content form .inputBox {
  position: relative;
  width: 225px;
  box-shadow: inset 2px 5px 10px rgba(0, 0, 0, 0.1),
  inset -2px -5px 10px rgba(255, 255, 255, 1),
  15px 15px 10px rgba(0, 0, 0, 0.05), 15px 10px 15px rgba(0, 0, 0, 0.025);
  border-radius: 25px;
}

.container .drop .content form .inputBox::before {
  content: "";
  position: absolute;
  top: 8px;
  left: 50%;
  transform: translateX(-50%);
  width: 65%;
  height: 5px;
  background: rgba(255, 255, 255, 0);
  border-radius: 5px;
}

.container .drop .content form .inputBox input {
  border: none;
  outline: none;
  background: transparent;
  width: 100%;
  font-size: 1em;
  padding: 10px 15px;
}

.container .drop .content form .inputBox input[type="submit"] {
  color: #fff;
  text-transform: uppercase;
  font-size: 1em;
  cursor: pointer;
  letter-spacing: 0.1em;
  font-weight: 500;
}

#loginBox .container .drop .content form .inputBox:nth-child(4){
  width: 120px;
  background: #3399ff;
  box-shadow: inset 2px 5px 10px rgba(0, 0, 0, 0.1),
  15px 15px 10px rgba(0, 0, 0, 0.05), 15px 10px 15px rgba(0, 0, 0, 0.025);
  transition: 0.5s;
}

#loginBox .container .drop .content form .inputBox:nth-child(4):hover {
  width: 150px;
}

.register{
  color: white;
  background: transparent;
  font-size: x-small;
  border: none;
}

/deep/ .single-uploader .el-upload {
  width: 128px;
  height: 128px;
  position: relative;
  overflow: hidden;
  cursor: pointer;
  border: 1px dashed var(--el-border-color);
  border-radius: 128px;
  background: transparent;
  transition: var(--el-transition-duration-fast);
}

:deep(.el-checkbox){
  margin: 0px 0px 0px !important;
  color:white;
}

:deep(input:-webkit-autofill) {
  box-shadow: 0 0 0px 999px rgba(0, 0, 0, 0) inset !important;
  -webkit-transition-delay: 99999s;
  -webkit-transition: color 99999s ease-out, background-color 99999s ease-out;
}


</style>
