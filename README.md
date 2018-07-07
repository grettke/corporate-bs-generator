# corporate-bs-generator - Generate random corporate buzz phrases

*Author:* Grant Rettke <gcr@wisdomandwonder.com><br>
*URL:* [http://raw.githubusercontent.com/grettke/corporate-bs-generator/master/corporate-bs-generator.el](http://raw.githubusercontent.com/grettke/corporate-bs-generator/master/corporate-bs-generator.el)<br>

## Overview

Generate random corporate buzz phrases to impress your friends and get
ahead in the industry.

Useful in elevator pitches, business meetings, and most organizational events.

## Usage

<table border="1">
  <caption>API</caption>
  <tr>
    <th>Keystroke</th>
    <th>Documentation</th>
  </tr>
  <tr>
    <td><i>M-x corporate-bs-generator-create</i></td>
    <td>Display a phrase in the minibuffer.</td>
  </tr>
  <tr>
    <td><i>C-u M-x corporate-bs-generator-create</i></td>
    <td>Display a phrase in the minibuffer and insert it into this buffer.</td>
  </tr>
  <tr>
    <td><i>C-u C-u M-x corporate-bs-generator-create</i></td>
    <td>Display a phrase in the minibuffer and add it to the kill-ring. Insert this value later on with <i>C-y</i>.</td>
  </tr>
</table>

## Installation

Download it to `~/src`.

Add the following to your init file to

* Add it to your load path
* Load it

        (add-to-list 'load-path "~/src/corporate-bs-generator")
        (require 'corporate-bs-generator)

## Credits

* [Tommy's Blessing](https://www.atrixnet.com/bs-generator.html)
* Mom pair programmed it with me. Thank you mom!


---
Converted from `corporate-bs-generator.el` by [*el2markdown*](https://github.com/Lindydancer/el2markdown).
