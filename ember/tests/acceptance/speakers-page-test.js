import { test } from 'qunit';
import moduleForAcceptance from 'ember-mojo-todo/tests/helpers/module-for-acceptance';

moduleForAcceptance('Acceptance | speakers page');

test('visiting /speakers-page', function(assert) {
  visit('/speakers');

  andThen(function() {
    assert.equal(find('a:contains("Bugs Bunny")').length, 1);
    assert.equal(find('a:contains("Wile E. Coyote")').length, 1);
    assert.equal(find('a:contains("Yosemite Sam")').length, 1);
  });
});

test('Should be able to navigate to a speaker page', function(assert) {
  visit('/speakers');
  andThen(function() {
    click('a:contains("Bugs Bunny")');
  });
  andThen(function() {
    assert.equal(find('h4').text(), 'Bugs Bunny');
  });
});

test('Should be able visit a speaker page', function(assert) {
  visit('/speakers/1');

  andThen(function() {
    assert.equal(find('h4').text(), 'Bugs Bunny');
  });
});

test('Should list all speakers and number of presentations', function(assert) {
  visit('/speakers');
  andThen(function() {
    assert.equal(find('a:contains("Bugs Bunny (2)")').length, 1);
    assert.equal(find('a:contains("Wile E. Coyote (1)")').length, 1);
    assert.equal(find('a:contains("Yosemite Sam (3)")').length, 1);
  });
});
