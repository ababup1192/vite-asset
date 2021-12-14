import './style.css'
import { Elm } from './Main.elm'

import favicon from "./favicon.svg";

Elm.Main.init({ node: document.querySelector('main'), flags: { favicon: favicon } })


