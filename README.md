

HTTP    |        ROUTE      | Action        | Used For
GET            /todos           index           Displays all todos
GET           /todos/:id        show             Display the todo with given ID
GET          /todos/new         new             form for creating new todo
POST            /todos          create          creates the new todo
GET        /todos/:id/edit      edit            display form to edit todo
PATCH/PUT   /todos/:id          update          updates todos with new content
DELETE      /todos/:id          destroy         deletes id item from existance