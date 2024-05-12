var testAPI = "http://localhost:8080/new"

function getData(render) {
	fetch(testAPI)
		.then(function(response) {
			return response.json();
		})
		.then(render)
}

function render(tests) {
	var list = document.getElementById("body");
	var htmls = tests.map(function(test) {
		return `
		<tr>
		    <td>${test.id}</td>
		    <td>${test.name}</td>
		    <td>${test.dob}</td>
		    <td>${test.department}</td>
		    <td>${test.approved}</td>
		    <td>
		        <button onclick='deleteTest("${test.id}")'>Delete</button>
		        <button>Edit</button>
		    </td>
		</tr>
		`;
	});
	list.innerHTML = htmls.join('');
}
function start() {
	getData(render);
}
start();
async function add() {
	const id = document.querySelector('input[name="id"]').value;
	const name = document.querySelector('input[name="name"]').value;
	const dob = document.querySelector('input[name="dob"]').value;
	const department = Array.from(document.querySelectorAll('input[name="1"]:checked')).map(item => item.value).join(' ');
	const approved = 0;
	const formData = {
		id: id,
		name: name,
		dob: dob,
		department: department,
		approved: approved
	}
	const fetchOption = {
		method: "POST",
		headers: {
			"Content-Type": 'application/json'
		},
		body: JSON.stringify(formData)
	}
	const response = await fetch(testAPI, fetchOption);
	if (!response.ok) {
		alert("FAIL");
		const errors = await response.json();
		const fields = Object.keys(errors);
		for (let field of fields) {
			const message = errors[field];
			const errorElement = document.getElementById(`${field}-error`);
			errorElement.textContent = message;
		}
	}
	else {
		window.location.href = "/";
		sessionStorage.setItem("department",department);
	}
}

async function deleteTest(id) {
	const formData = {
		id: id,
	}
	const fetchOption = {
		method: "DELETE",
		headers: {
			"Content-Type": 'application/json'
		},
		body: JSON.stringify(formData)
	}
	const response = await fetch(testAPI, fetchOption);
	if (!response.ok) {
		alert("FAIL");
	}
	else {
		window.location.href = "/"
	}
}
