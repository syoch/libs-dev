BUILD?=build

.PHONY: dummy
dummy:

-include modules/syoch-robotics/makefile.d/all.mk
-include $(wildcard makefile.d/*.mk)
-include $(wildcard src*/Makefile)
-include $(wildcard /usr/share/robotics/task.d/*.mk)
