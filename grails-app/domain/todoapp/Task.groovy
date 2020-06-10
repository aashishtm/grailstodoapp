package todoapp

class Task {
    String title
    String memo
    Member member

    static constraints = {
        title(nullable: false, blank: false)
    }
}
