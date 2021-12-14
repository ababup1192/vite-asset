import './style.css'
import { Elm } from './Main.elm'

import favicon from "./favicon.svg";

console.log(favicon);

Elm.Main.init({ node: document.querySelector('main') })


