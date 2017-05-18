#! /bin/bash

out=$(mktemp -t tenniskata)
while true ; do
	# Clear *after* running to avoid empty terminal while running
	bundle exec ruby tennis_test.rb --use-color --order=defined > $out
	clear
	cat $out
	rm -f $out
	# Non-integer value works with GNU sleep(1) and Darwin's sleep(1)
	# but who knows what happens on HPUX or Solaris or Irix or Windows.
	sleep 0.3
done
