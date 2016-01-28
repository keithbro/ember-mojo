export default function() {
  const speakers = [
    {
      id: "1",
      name: "Bugs Bunny",
    },
    {
      id: "2",
      name: "Wile E. Coyote",
    },
    {
      id: "3",
      name: "Yosemite Sam",
    },
  ];

  this.get('/speakers', function(db, request) {
    return { speakers: speakers };
  });

  this.get('/speakers/:id', function(db, request) {
    return {
      speaker: speakers.findBy('id', request.params.id),
    };
  });
}
