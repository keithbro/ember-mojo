use utf8;
package EmberMojo::Schema::Result::Speaker;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EmberMojo::Schema::Result::Speaker

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<speaker>

=cut

__PACKAGE__->table("speaker");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 512 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 presentations

Type: has_many

Related object: L<EmberMojo::Schema::Result::Presentation>

=cut

__PACKAGE__->has_many(
  "presentations",
  "EmberMojo::Schema::Result::Presentation",
  { "foreign.speaker_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-01-28 21:52:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/vs9mpsA6n5DOOdiuZGpyQ

sub as_data {
    my $self = shift;

    +{
        id            => $self->id,
        name          => $self->name,
        presentations => [ map { $_->id } $self->presentations ],
    };
}

1;
