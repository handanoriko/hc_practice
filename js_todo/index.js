document.getElementById("js-form").addEventListener("submit", (e) => {
    e.preventDefault();

    const formValue = document.getElementById("js-form-input").value;

    if (formValue) {
        const ul = document.getElementById("js-todo-list");
        const li = document.createElement("li");
        li.className= ("border-t py-3");

        const input = document.createElement('input');
        input.type = 'checkbox';
        input.name = 'todo';
        input.className = "checkbox";

        const span = document.createElement('span');
        span.id = 'js-span';

        const inputData = document.createTextNode(formValue);

        const editButton = createButton("編集", "rounded-2xl bg-slate-300 py-1 px-4 ml-4", "js-edit");
        const deleteButton = createButton("削除", "rounded-2xl bg-slate-300 py-1 px-4 ml-2", "js-delete");

        span.appendChild(input);
        span.appendChild(inputData);
        li.appendChild(span);
        li.appendChild(editButton);
        li.appendChild(deleteButton);
        ul.appendChild(li);

        document.getElementById("js-form-input").value = "";

        completeCheckbox(input);
        edit(editButton);
        updateCounts();
        todoDelete(deleteButton);
        
    }
})

const createButton = (text, className, id) => {
    const button = document.createElement("button");
    button.innerHTML = text;
    button.className = className;
    button.id = id;
    return button;
}

const completeCheckbox = (checkbox) => {
    checkbox.addEventListener("click", function() {
        const span = this.parentElement;
        span.classList.toggle("line-through");
        updateCounts();
    });
};

const updateCounts = () => {
    const completeCount = document.querySelectorAll('.line-through').length;
    const allCount = document.querySelectorAll('li').length;
    const imcompleteCount = allCount - completeCount;
    console.log(allCount);
    console.log(completeCount);
    console.log(imcompleteCount);

    document.getElementById("js-todo-completeCount").textContent= `完了済み: ${completeCount}`;
    document.getElementById("js-todo-allCount").textContent= `全てのタスク: ${allCount}`;
    document.getElementById("js-todo-imcompleteCount").textContent= `未完了: ${imcompleteCount}`;
}


const edit = (button) => {
    const li = button.closest("li");
    const span = li.querySelector("span");

    const saveListener = function() {
        span.contentEditable = "false";
        button.innerHTML = "編集";
        button.removeEventListener("click", saveListener);
        button.addEventListener("click", editListener);
    };

    const editListener = function() {
        span.contentEditable = "true";
        span.focus();
        button.innerHTML = "保存";
        button.removeEventListener("click", editListener);
        button.addEventListener("click", saveListener);
    };

    button.addEventListener("click", editListener);
};

const todoDelete = (button) => {
    button.addEventListener("click", () => {
        const li = button.closest("li");
        li.remove();
        updateCounts();
    });
};

document.querySelectorAll(".js-edit").forEach(button => {
    edit(button);
});


document.querySelectorAll(".js-delete").forEach(button => {
    todoDelete(button);
});


document.querySelectorAll(".checkbox").forEach(checkbox => completeCheckbox(checkbox));

updateCounts();