const darkmode = "dark-mode";

function toggleHs(h) {
	let hs = document.getElementsByTagName(h);
	for (let i = 0; i < hs.length; i++) {
		hs[i].classList.toggle(darkmode);
	}
}

/*
 * Toggle the dark-mode class on specific elements to switch to a dark theme.
 */
function toggleDarkMode() {
	let element = document.body;
	element.classList.toggle(darkmode);
	toggleHs("h1");
	toggleHs("h2");
	toggleHs("h3");
	toggleHs("a");
}
