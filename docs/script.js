const darkmode = "dark-mode";
const tags = [ "h1", "h2", "h3", "a" ];

function toggleTags(tagName) {
	let ts = document.getElementsByTagName(tagName);
	for (let i = 0; i < ts.length; i++) {
		ts[i].classList.toggle(darkmode);
	}
}

/*
 * Toggle the dark-mode class on specific elements to switch to a dark theme.
 */
function toggleDarkMode() {
	let element = document.body;
	element.classList.toggle(darkmode);
	for (let i = 0; i < tags.length; i++) {
		toggleTags(tags[i]);
	}
}
