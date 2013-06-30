function startup(updateState) {
	$(document).ready(function () {
		getCurrentUser(function (user) {
			window.currentUser = user;

			updateState(location.hash);
			window.onhashchange = function () {
				updateState(location.hash)
			};
		});
	});

}

function availableBookFilter(book) {
	return book.holder == null;
}

function loanBookFilter(book) {
	return book.holder != null;
}

function allBookFilter(book) {
	return true;
}

function createMyBookFilter(userName) {
	return function (book) {
		return book.holder == userName;
	}
}

function createBookTagFilter(tag) {
	return function (book) {
		return book.tags != null && book.tags.indexOf(tag) > -1;
	}
}

function filterBooks(filter, books) {
	var filteredBooks = [];

	if (books != null) {
		for (var i = 0; i < books.length; i++) {
			var book = books[i];
			if (filter(book)) {
				filteredBooks.push(book);
			}
		}
	}

	return filteredBooks;
}

function showBooks(filter) {
	getBooks(function (books) {
		var filteredBooks = filterBooks(filter, books);
		drawBooksList(filteredBooks);
	});
}

function showBook(id) {
	getBook(id, function (book) {
		drawBook(book);
	});
}

function showDashboard() {
	getDashboard(drawDashboard);
}

function holdBook(id, onBookPage) {
	$.ajax({
		type: "PUT",
		url: "/api/book?id=" + id}).done(function (msg) {
			clearCache();

			if (onBookPage) {
				window.location = "/book#" + id;
			} else {
				window.location = "/books#show=loan";
			}
		});
}

function drawBooksList(books) {
	// очистим все книги, которые уже могут быть отображены в блоке
	$("#books-block").empty();

	$.get("/template/bookslist_template.html", function (template) {
		// отрендерим темплейт
		var htmlContent = Mustache.render(template, new Object({books: books}));
		// запулим HTML в блок
		$("#books-block").append(htmlContent);
	});
}

function drawBook(book) {
	$("#book-block").empty();

	// удалим старый контент, не будем засирать DOM
	$.get("/template/bookdetails_template.html", function (template) {
		// отрендерим темплейт
		var htmlContent = Mustache.render(template, book);
		// запулим HTML в блок
		$("#book-block").append(htmlContent);
	});
}

function drawDashboard(dashboard) {
	$.get("/template/dashboard_template.html", function (template) {
		// отрендерим темплейт
		var htmlContent = Mustache.render(template, dashboard);
		// запулим HTML в блок
		$("#dashboard-block").append(htmlContent);
	});
}

function getBooks(callback) {
	var cachedBooks = window.localStorage.getItem("books-cache");
	if (cachedBooks != null) {
		// ага, в локальном кеше что-то есть, проверим
		cachedBooks = JSON.parse(cachedBooks);
		if (cachedBooks.timestamp != null && cachedBooks.books != null) {
			if (cachedBooks.timestamp > Date.now() - (1000 * 60)) {
				// данные в локальном кеше не старее 1 минуты, используем их
				callback(cachedBooks.books);
				return;
			}
		}
	}

	// в кеше неведомое говно, загрузим с сервера
	$.getJSON('/api/books.json', function (data) {
		// закешируем свежие данные
		cachedBooks = new Object({timestamp: Date.now(), books: data});
		window.localStorage.setItem("books-cache", JSON.stringify(cachedBooks));

		// начнем отображать
		callback(data);
	});
}

function getBook(id, callback) {
	$.getJSON('/api/book.json?id=' + id, callback);
}

function getCurrentUser(callback) {
	$.getJSON('/api/user.json', callback);
}

function getDashboard(callback) {
	$.getJSON('/api/dashboard.json', callback);
}

function clearCache() {
	window.localStorage.setItem("books-cache", "");
}