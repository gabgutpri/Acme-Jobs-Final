<%--
- menu.jsp
-
- Copyright (c) 2019 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java" import="acme.framework.helpers.PrincipalHelper"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:menu-bar code="master.menu.home">
	<acme:menu-left>
		
		<%-- COSAS DE ANONIMO --%>
		
		<acme:menu-option code="master.menu.anonymous" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.announcement.list" action="/anonymous/announcement/list"/>
      			<acme:menu-suboption code="master.menu.anonymous.company-record.list" action="/anonymous/company-record/list"/>
			<acme:menu-suboption code="master.menu.anonymous.company-record.five-stars" action="/anonymous/company-record/five-stars"/>
			<acme:menu-suboption code="master.menu.anonymous.investor-record.list" action="/anonymous/investor-record/list"/>
			<acme:menu-suboption code="master.menu.anonymous.investor-record.five-stars" action="/anonymous/investor-record/five-stars"/>
		</acme:menu-option>
		
		<%-- COSAS DE AUTENTICADO --%>
		
		<acme:menu-option code="master.menu.authenticated" access="isAuthenticated()" >
			<acme:menu-suboption code="master.menu.authenticated.announcement.list" action="/authenticated/announcement/list"/>
			<acme:menu-suboption code="master.menu.authenticated.challenge.list" action="/authenticated/challenge/list"/>
			<acme:menu-suboption code="master.menu.authenticated.company-record.list" action="/authenticated/company-record/list"/>
			<acme:menu-suboption code="master.menu.authenticated.investor-record.list" action="/authenticated/investor-record/list"/>
			<acme:menu-suboption code="master.menu.authenticated.offer.list" action="/authenticated/offer/list"/>
			<acme:menu-suboption code="master.menu.authenticated.request.list" action="/authenticated/request/list"/>
			<acme:menu-suboption code="master.menu.authenticated.job.list" action="/authenticated/job/list-active"/>
			<acme:menu-separator/>
			
			<acme:menu-suboption code="master.menu.authenticated.messageThread.list" action="/authenticated/message-thread/list-mine"/>

		</acme:menu-option>
	
		<%-- COSAS DE ADMIN --%>
		
		<acme:menu-option code="master.menu.administrator" access="hasRole('Administrator')">
			<acme:menu-suboption code="master.menu.administrator.user-accounts" action="/administrator/user-account/list"/>
			<acme:menu-suboption code="master.menu.administrator.announcement.list" action="/administrator/announcement/list"/>
			<acme:menu-suboption code="master.menu.administrator.commercial-banner.list" action="/administrator/commercial-banner/list"/>
			<acme:menu-suboption code="master.menu.administrator.non-commercial-banner.list" action="/administrator/non-commercial-banner/list"/>
			
			<acme:menu-separator/>
			
			<acme:menu-suboption code="master.menu.administrator.announcement.create" action="/administrator/announcement/create"/>
			<acme:menu-suboption code="master.menu.administrator.commercial-banner.create" action="/administrator/commercial-banner/create"/>
			<acme:menu-suboption code="master.menu.administrator.non-commercial-banner.create" action="/administrator/non-commercial-banner/create"/>			
			<acme:menu-suboption code="master.menu.administrator.challenge.create" action="/administrator/challenge/create"/>
			<acme:menu-suboption code="master.menu.administrator.company-record.create" action="/administrator/company-record/create"/>
			<acme:menu-suboption code="master.menu.administrator.investor-record.create" action="/administrator/investor-record/create"/>
			
			<acme:menu-separator/>
     		
     		<acme:menu-suboption code="master.menu.administrator.dashboard.show" action="/administrator/dashboard/show"/>
     		<acme:menu-suboption code="master.menu.administrator.customization-parameter" action="/administrator/customization-parameter/show"/>
     		
     		<acme:menu-separator/>
     		<acme:menu-suboption code="master.menu.administrator.auditor-request.list" action="/administrator/auditor-request/list"/>
			<acme:menu-separator/>
     		
			<acme:menu-suboption code="master.menu.administrator.shutdown" action="/master/shutdown"/>
		</acme:menu-option>
	
		<%-- COSAS DE WORKER --%>
		
		<acme:menu-option code="master.menu.worker" access="hasRole('Worker')">
			<acme:menu-suboption code="master.menu.worker.application.list" action="/worker/application/list-mine"/>
		</acme:menu-option>
		
	  <%-- COSAS DE EMPLOYER --%>

		<acme:menu-option code="master.menu.employer" access="hasRole('Employer')">
			<acme:menu-suboption code="master.menu.employer.job.list" action="/employer/job/list-mine"/>
			<acme:menu-suboption code="master.menu.employer.application.list" action="/employer/application/list-mine"/>
			<acme:menu-suboption code="master.menu.employer.job.create" action="/employer/job/create"/>
			<acme:menu-suboption code="master.menu.employer.descriptor.create" action="/employer/descriptor/create"/>
			<acme:menu-suboption code="master.menu.employer.duty.create" action="/employer/duty/create"/>
			<acme:menu-suboption code="master.menu.employer.application.list.order" action="/employer/application/list-order"/>
		
		</acme:menu-option>
		
		<%-- COSAS DE AUDITOR --%>

		<acme:menu-option code="master.menu.auditor" access="hasRole('Auditor')">
			<acme:menu-suboption code="master.menu.auditor.job.list" action="/auditor/job/list-written"/>
			<acme:menu-suboption code="master.menu.auditor.job.list-not-written" action="/auditor/job/list-not-written"/>
		</acme:menu-option>
	
		<%-- COSAS DE SPONSOR --%>
		
		<acme:menu-option code="master.menu.sponsor" access="hasRole('Sponsor')">
			<acme:menu-suboption code="master.menu.sponsor.commercial-banner.list" action="/sponsor/commercial-banner/list-mine"/>
			<acme:menu-suboption code="master.menu.sponsor.non-commercial-banner.list" action="/sponsor/non-commercial-banner/list-mine"/>
			
			<acme:menu-separator/>
			
			<acme:menu-suboption code="master.menu.sponsor.commercial-banner.create" action="/sponsor/commercial-banner/create"/>
			<acme:menu-suboption code="master.menu.sponsor.non-commercial-banner.create" action="/sponsor/non-commercial-banner/create"/>
		</acme:menu-option>
		
	
	</acme:menu-left>
	
		<%-- AQUI COMIENZA LA PARTE DERECHA DEL MENU (DONDE ESTA EL LOGIN Y DEMAS) --%>
		
	<acme:menu-right>
		<acme:menu-option code="master.menu.sign-up" action="/anonymous/user-account/create" access="isAnonymous()"/>
		<acme:menu-option code="master.menu.sign-in" action="/master/sign-in" access="isAnonymous()"/>

		<acme:menu-option code="master.menu.user-account" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.user-account.general-data" action="/authenticated/user-account/update"/>

			<acme:menu-suboption code="master.menu.user-account.become-worker" action="/authenticated/worker/create" access="!hasRole('Worker')"/>
			<acme:menu-suboption code="master.menu.user-account.worker" action="/authenticated/worker/update" access="hasRole('Worker')"/>
			<acme:menu-suboption code="master.menu.user-account.become-employer" action="/authenticated/employer/create" access="!hasRole('Employer')"/>
			<acme:menu-suboption code="master.menu.user-account.employer" action="/authenticated/employer/update" access="hasRole('Employer')"/>
		
			<acme:menu-suboption code="master.menu.user-account.become-auditor" action="/authenticated/auditor-request/create" access="!hasRole('Auditor')"/>
			<acme:menu-suboption code="master.menu.user-account.auditor" action="/authenticated/auditor-request/update" access="hasRole('Auditor')"/>
			
			<acme:menu-suboption code="master.menu.user-account.become-sponsor" action="/authenticated/sponsor/create" access="!hasRole('Sponsor')"/>
			<acme:menu-suboption code="master.menu.user-account.sponsor" action="/authenticated/sponsor/update" access="hasRole('Sponsor')"/>

		</acme:menu-option>

		<acme:menu-option code="master.menu.sign-out" action="/master/sign-out" access="isAuthenticated()"/>
	</acme:menu-right>
</acme:menu-bar>
