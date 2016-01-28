import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('about');
  this.route('speakers');
  this.route('speaker', { path: "/speakers/:id" });
});

export default Router;
