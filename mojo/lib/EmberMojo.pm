package EmberMojo;
use Mojo::Base 'Mojolicious';
use EmberMojo::Schema;

# This method will run once at server start
sub startup {
    my $self = shift;

    $self->plugin('PODRenderer');

    my $schema = EmberMojo::Schema->connect(
        "dbi:mysql:database=embermojo", "root"
    );

    my $r = $self->routes;

    $r->get('/speakers')->to(cb => sub {
        my $c = shift;
        my $speakers = [
            map { $_->as_data }
            $schema->resultset("Speaker")->all
        ];
        my $presentations = [
            map { $_->as_data }
            $schema->resultset("Presentation")->all
        ];
        $c->render(json => {
            speakers => $speakers,
            presentations => $presentations,
        });
    });

    $r->get('/speakers/:id')->to(cb => sub {
        my $c = shift;
        my $speaker =
            $schema->resultset("Speaker")->find($c->param("id"))->as_data;
        $c->render(json => { speaker => $speaker });
    });
}

1;
