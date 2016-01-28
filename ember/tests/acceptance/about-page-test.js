import { test } from 'qunit';
import moduleForAcceptance from 'ember-mojo-todo/tests/helpers/module-for-acceptance';

moduleForAcceptance('Acceptance | about page');

test('visiting /about-page', function(assert) {
  visit('/');

  andThen(function() {
    click("a:contains('About')");
  });
  andThen(function() {
    assert.equal(find('h3').text(), 'About');
  });
});
