#### Ubuntu doesn't shutdown properly or hangs at shutdown?

Issue faced While installing Ubunutu 14.04 in Dell XPS 15Z Laptop

* Edit the file


```
# sudo gedit /etc/default/grub
```

* And modify the line :


```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```


* It to obtain this line :


```
GRUB_CMDLINE_LINUX_DEFAULT="acpi=noirq acpi=force apm=power_off quiet splash"
```

* Then, save, close, and back in the terminal, execute :


```
# sudo update-grub
```

Now, when you will Shutdown, it should Work great.

