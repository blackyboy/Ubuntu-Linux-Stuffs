Create a LVM snapshot: lvcreate -L10G -s -n tmp_fserver_backup /dev/brace/fserver_root

That'll create a 10G(max) snapshot named "tmp_fserver_backup" from the LVM volume /dev/brace/fserver_root

From there you can make a new logical volume, and dd it in there.