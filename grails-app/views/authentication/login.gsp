<meta name="layout" content="public"/>

<div id="global-wrapper">
    <div id="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 mx-auto">
                    <h1 class="text-center font-weight-bold text-uppercase login-title">Todo App Login</h1>
                   <div class="card-img text-center mb-4">
                       <g:img dir="images" file="grails.svg" class="profile-img m-auto"/>
                   </div>
                    <div class="account-wall">
                        <g:form controller="authentication" action="doLogin" class="form-signin">
                            <g:textField name="email" class="form-control mb-4" placeholder="Email" required="required" />
                            <g:passwordField name="password" class="form-control mb-4" placeholder="Password" required="required" />
                            <g:submitButton class="btn btn-lg btn-primary btn-block" name="login" value="Login"/>
                            <g:link controller="authentication" action="registration" class="btn btn-lg btn-primary btn-block">Member Registration</g:link>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>