<div class="form-group">
    <label><g:message code="task.title"/> *</label>
    <g:textField name="title" class="form-control" value="${task?.title}" placeholder="Please Enter Task Title"/>
    <UIHelper:renderErrorMessage fieldName="title" model="${task}" errorMessage="please.enter.title"/>
    <label><g:message code="task.memo"/></label>
    <g:textArea name="memo" class="form-control" value="${task?.memo}" placeholder="Please Enter Task Title"/>
    <UIHelper:renderErrorMessage fieldName="memo" model="${task}" errorMessage="please.enter.title"/>
</div>