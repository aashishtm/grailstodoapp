package todoapp

class TaskController {
    TaskService taskService
    AuthenticationService authenticationService

//    def index() {
//        if (authenticationService.isAdministratorMember()){
//            def response = taskService.adminlist(params)
//            [task: response.list, total: response.count]
//        } else {
//            def response = taskService.list(params)
//            [task: response.list, total: response.count]
//        }
//    }

    def index() {
        def response = taskService.list(params)
        [task: response.list, total: response.count]
    }

    def details(Integer id) {
        def response = taskService.get(id)
        if (!response) {
            redirect(controller: "task", action: "index")
        } else {
            [task: response]
        }
    }

    def create() {
        [task: flash.redirectParams]
    }

    def save() {
        def response = taskService.save(params)
        if (response.isSuccess) {
            flash.message = AppUtil.infoMessage(g.message(code: "saved"))
            redirect(controller: "task", action: "index")
        } else {
            flash.redirectParams = response.model
            flash.message = AppUtil.infoMessage(g.message(code: "unable.to.save"), false)
            redirect(controller: "task", action: "create")
        }
    }

    def edit(Integer id) {
        if (flash.redirectParams) {
            [task: flash.redirectParams]
        } else {
            def response = taskService.get(id)
            if (!response) {
                flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity"), false)
                redirect(controller: "task", action: "index")
            } else {
                [task: response]
            }
        }
    }

    def update() {
        def response = taskService.get(params.id)
        if (!response) {
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity"), false)
            redirect(controller: "task", action: "index")
        } else {
            response = taskService.update(response, params)
            if (!response.isSuccess) {
                flash.redirectParams = response.model
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.update"), false)
                redirect(controller: "task", action: "edit")
            } else {
                flash.message = AppUtil.infoMessage(g.message(code: "updated"))
                redirect(controller: "task", action: "index")
            }
        }
    }

    def delete(Integer id) {
        def response = contactGroupService.get(id)
        if (!response) {
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity"), false)
            redirect(controller: "task", action: "index")
        } else {
            response = taskService.delete(response)
            if (!response) {
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.delete"), false)
            } else {
                flash.message = AppUtil.infoMessage(g.message(code: "deleted"))
            }
            redirect(controller: "task", action: "index")
        }
    }
}
