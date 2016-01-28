use utf8;
package EmberMojo::Schema::Result::Presentation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EmberMojo::Schema::Result::Presentation

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<presentation>

=cut

__PACKAGE__->table("presentation");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 speaker_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "speaker_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 speaker

Type: belongs_to

Related object: L<EmberMojo::Schema::Result::Speaker>

=cut

__PACKAGE__->belongs_to(
  "speaker",
  "EmberMojo::Schema::Result::Speaker",
  { id => "speaker_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-01-28 22:01:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:suKxmBiYf28l5v3uxsmsPw

sub as_data {
    my $self = shift;

    +{
        id => $_->id,
        title => $_->title,
    };
}

1;
