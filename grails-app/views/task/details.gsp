<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
        <g:message code="task" args="['Details']"/>
    </div>
    <div class="card-body">
        <g:if test="${task}">
            <table class="table">
                <tr>
                    <th class="text-right">Title</th><td class="text-left">${task.title}</td>
                </tr>
                <tr>
                    <td class="text-right">Memo</td><td class="text-left">${task.memo}</td>
                </tr>
            </table>
        </g:if>
        <div class="form-action-panel">
            <g:link controller="task" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
        </div>
    </div>
</div>