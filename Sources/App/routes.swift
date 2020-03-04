import Vapor

/// Register your application's routes here.

public func routes(_ router: Router) throws {
    // Basic "It works" example
  router.get { req -> String in
    if #available(OSX 10.12, *) {
      let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
          print ("tik tak")
      })
      timer.fire()
    }
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
  

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
