component {

    this.title        = "cbguard";
    this.description  = "Enforce secured actions via annotations and permissions";
    this.version      = "1.0.0";
    this.cfmapping    = "cbguard";
    this.dependencies = [];

    function configure() {
        settings = {
            "authenticationService"           = "authenticationService@cbauth",
            "authenticationOverrideEvent"     = "Main.onAuthenticationFailure",
            "authenticationAjaxOverrideEvent" = "",
            "authorizationOverrideEvent"      = "Main.onAuthorizationFailure",
            "authorizationAjaxOverrideEvent"  = "",
            "methodNames" = {
                "getUser"       = "getUser",
                "isLoggedIn"    = "isLoggedIn",
                "hasPermission" = "hasPermission"
            }
        };

        if ( settings.authenticationAjaxOverrideEvent == "" ) {
            settings.authenticationAjaxOverrideEvent = settings.authenticationOverrideEvent;
        }

        if ( settings.authorizationAjaxOverrideEvent == "" ) {
            settings.authorizationAjaxOverrideEvent = settings.authorizationOverrideEvent;
        }
    }

    function onLoad() {
        controller.getInterceptorService().registerInterceptor(
            interceptorClass = "#moduleMapping#.interceptors.SecuredEventInterceptor",
            interceptorProperties = settings
        );
    }

}
