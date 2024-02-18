<CFCOMPONENT displayname="Application" output="true" hint="Handle the login/logout.">
    <CFSCRIPT>
        this.SessionManagement = true;
        this.SessionTimeout = CreateTimeSpan( 0, 1, 0, 0 );
        SessionRotate();
        SESSION.userId = "";
        SESSION.userLogin = "";
        SESSION.isLoggedIn = false;
    </CFSCRIPT>
    <CFSETTING
            requesttimeout="20"
            showdebugoutput="false"
            enablecfoutputonly="false"
    />
</CFCOMPONENT>
