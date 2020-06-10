package todoapp

import grails.web.servlet.mvc.GrailsParameterMap

class TaskService {

    AuthenticationService authenticationService

    def save(def params) {
        Task task = new Task(params)
        task.member = (authenticationService.getMember())
        def response = AppUtil.saveResponse(false, task)
        if (task.validate()) {
            response.isSuccess = true
            task.save()
        }
        return response
    }

    def update(Task task, GrailsParameterMap params) {
        task.properties = params
        def response = AppUtil.saveResponse(false, task)
        if (task.validate()) {
            response.isSuccess = true
            task.save(flush:true)
        }
        return response
    }

    def get(Serializable id) {
        return Task.get(id)
    }

    def list(GrailsParameterMap params) {
        params.max = params.max ?: GlobalConfig.itemsPerPage()
        List<Task> taskList = Task.createCriteria().list(params) {
            if (params?.colName && params?.colValue) {
                like(params.colName, "%" + params.colValue + "%")
            }
            if (!params.sort) {
                order("id", "desc")
            }
            eq("member", authenticationService.getMember())
        }
        return [list: taskList, count: taskList.totalCount]
    }

//    def adminlist(GrailsParameterMap params) {
//        params.max = params.max ?: GlobalConfig.itemsPerPage()
//        List<Task> taskList = Task.createCriteria().list(params) {
//            if (params?.colName && params?.colValue) {
//                like(params.colName, "%" + params.colValue + "%")
//            }
//            if (!params.sort) {
//                order("id", "desc")
//            }
//        }
//        return [list: taskList, count: taskList.totalCount]
//    }


    def getTaskList(){
        return Task.createCriteria().list {
            eq("member", authenticationService.getMember())
        }
    }

    def delete(Task task) {
        try {
            task.delete(flush: true)
        } catch (Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }

}
