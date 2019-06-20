package com.shu.user.web.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.shu.user.domain.User;
import com.sun.net.httpserver.Authenticator;
import org.aopalliance.intercept.Invocation;

/**
 * @author panyexiong
 * @date 2019/4/12 - 10:53
 */
public class LoginInterceptor extends MethodFilterInterceptor {

    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {

        Object loginUser = ActionContext.getContext().getSession().get("loginUser");
        if (loginUser == null){
            //没有登录
            return "login";
        }

        //已经登录，放行
        return actionInvocation.invoke();
    }
}
