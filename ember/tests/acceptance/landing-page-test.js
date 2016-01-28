import { test } from 'qunit';
import moduleForAcceptance from 'ember-mojo-todo/tests/helpers/module-for-acceptance';

moduleForAcceptance('Acceptance | landing page');

test('visiting /landing-page', function(assert) {
  visit('/');

  andThen(function() {
    assert.equal(find("h2#title").text(), "Welcome to Ember Mojo");
  });
});

test('Should allow navigating back to root from another page', function(assert) {
  visit('/about');

  andThen(function() {
    click('a:contains("Home")');
  });
  andThen(function() {
    assert.notEqual(find('h3').text(), 'About');
  });
});
