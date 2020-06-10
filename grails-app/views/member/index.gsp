<meta name="layout" content="main"/>
<div class="text-center font-weight-bold text-uppercase"><g:message code="member" args="['List']"/></div>


<div class="card rounded shadow">
    <div class="card-header rounded">
        %{--Actions--}%
        <span class="float-right">

            %{--Search Panel --}%
            <div class="btn-group">
                <g:form controller="member" action="index" method="GET">
                    <div class="input-group" id="search-area">
                        <g:textField name="colValue" class="form-control" value="${params?.colValue}"/>
                        <g:select name="colName" class="form-control rounded" from="[firstName: 'First Name', lastName: 'Last Name', email: 'Email']" value="${params?.colName}" optionKey="key" optionValue="value"/>
                        <span class="input-group-btn">
                        <button class="btn btn-secondary" type="submit"><i class="fa fa-search">&nbsp;Search</i></button>
                        </span>
                    </div>
                </g:form>
            </div>

            %{--Create and Reload Panel--}%
            <div class="btn-group">
                <g:link controller="member" action="create" class="btn btn-success"><g:message code="create"/></g:link>
                <g:link controller="member" action="index" class="btn btn-primary"><g:message code="reload"/></g:link>
            </div>
        </span>
    </div>

    %{--Table Panel--}%
    <div class="card-body">
        <table class="table table-bordered">
            <thead>
                <g:sortableColumn property="firstName" title="${g.message(code: "first.name")}"/>
                <g:sortableColumn property="lastName" title="${g.message(code: "last.name")}"/>
                <g:sortableColumn property="email" title="${g.message(code: "email")}"/>
                <th class="action-row"><g:message code="action"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${memberList}" var="info">
                <tr>
                    <td>${info?.firstName}</td>
                    <td>${info?.lastName}</td>
                    <td>${info?.email}</td>

                    %{--Table Actions --}%
                    <td>
                        <div class="btn-group">
                            <g:link controller="member" action="details" class="btn btn-primary" id="${info.id}"><i class="fa fa-eye">Detail</i></g:link>
                            <g:link controller="member" action="edit" class="btn btn-warning" id="${info.id}"><i class="fa fa-edit">Edit</i></g:link>
                            <g:link controller="member" action="delete" id="${info.id}" class="btn btn-danger delete-confirmation">Delete<i class="fa fa-trash"></i></g:link>
                        </div>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        %{--Pagination Area--}%
        <div class="paginate">
            <g:paginate total="${total ?: 0}" />
        </div>
    </div>
</div>