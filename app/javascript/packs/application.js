import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery';
import 'jquery-ui-dist/jquery-ui';
import 'stylesheets/application.css';



Rails.start()
Turbolinks.start()
ActiveStorage.start()
