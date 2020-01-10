<%--
- form.jsp
-
- Copyright (c) 2019 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form readonly="true">
	
	<acme:form-textbox code="authenticated.job.form.label.reference" path="reference"/>
	<acme:form-textbox code="authenticated.job.form.label.title" path="title"/>
	<acme:form-moment code="authenticated.job.form.label.deadline" path="deadline"/>
	<acme:form-money code="authenticated.job.form.label.salary" path="salary"/>
	<acme:form-url code="authenticated.job.form.label.moreInfo" path="moreInfo"/>
	<acme:form-textarea code="authenticated.job.form.label.status" path="status"/>
    
	<acme:form-submit code="authenticated.auditRecord.button.list" method="get" action="/authenticated/audit-record/list-corresponding?id=${id}"/>
	
	<acme:form-submit code="authenticated.descriptor.button.show" method="get" action="/authenticated/descriptor/show?id=${id}"/>
	
	<acme:check-access test="hasRole('Worker')">
		<acme:form-submit code="authenticated.application.button.create" method="get" action="/worker/application/create?jobId=${id}"/>
	</acme:check-access>
	<acme:form-return code="authenticated.job.form.button.return"/>
	
</acme:form>