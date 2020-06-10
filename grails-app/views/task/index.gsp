<meta name="layout" content="main"/>

<div class="text-center font-weight-bold text-uppercase">
    <g:message code="task" args="List"/>
</div>
<div class="card rounded shadow">
    <div class="card-header">
        <span class="float-right">
            <div class="btn-group">
                <g:link controller="task" action="create" class="btn btn-success"><g:message code="create"/></g:link>
                <g:link controller="task" action="index" class="btn btn-primary"><g:message code="reload"/></g:link>
            </div>
        </span>
    </div>
    <div class="card-body">
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <g:sortableColumn property="name" title="${g.message(code: "task.title")}"/>
                <g:sortableColumn property="name" title="${g.message(code: "task.memo")}"/>
                <g:sortableColumn property="name" title="${g.message(code: "task.member")}"/>
                <th class="action-row"><g:message code="action"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${task}" var="taskd">
                <tr>
                    <td>${taskd?.title}</td>
                    <td>${taskd?.memo}</td>
                    <td>${taskd?.member}</td>
                    <td>
                        <div class="btn-group">
                            <g:link controller="task" action="details" class="btn btn-primary" id="${taskd.id}"><i class="fa fa-eye">Detail</i></g:link>
                            <g:link controller="task" action="edit" class="btn btn-warning" id="${taskd.id}"><i class="fa fa-edit">Edit</i></g:link>
                            <g:link controller="task" action="delete" id="${taskd.id}" class="btn btn-danger delete-confirmation">Delete<i class="fa fa-trash"></i></g:link>
                        </div>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="paginate">
            <g:paginate total="${total ?: 0}" />
        </div>
    </div>
</div>