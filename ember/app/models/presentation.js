import DS from 'ember-data';

export default DS.Model.extend({
  speaker: DS.belongsTo('speaker'),
  title: DS.attr('string'),
});
