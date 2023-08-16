import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery'
import 'jquery-ui-dist/jquery-ui'
// app/javascript/packs/application.js
import '../assets/stylesheets/application.scss';





Rails.start()
Turbolinks.start()
ActiveStorage.start()
