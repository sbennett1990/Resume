/*
 * Copyright (c) 2020 Scott Bennett <scottb@fastmail.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

const buttonid = "dark-mode-btn";
const darkmode = "dark-mode";
const tags = [ "h1", "h2", "h3", "a" ];

/*
 * Add the dark-mode button if JS is enabled.
 */
function addButton() {
	let btn = document.createElement("button");
	btn.setAttribute("id", buttonid);
	btn.setAttribute("type", "button");
	btn.onclick = toggleDarkMode;
	let text = document.createTextNode("Dark");
	btn.appendChild(text);
	// insert the button above the one-and-only article
	let mainArticle = document.getElementsByTagName("article")[0];
	document.body.insertBefore(btn, mainArticle);
}

function toggleButton() {
	let btn = document.getElementById(buttonid);
	if (btn.classList.contains(darkmode)) {
		btn.innerHTML = "Dark";
	}
	else {
		btn.innerHTML = "Light";
	}
	btn.classList.toggle(darkmode);
}

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
	toggleButton();
	for (let i = 0; i < tags.length; i++) {
		toggleTags(tags[i]);
	}
}
