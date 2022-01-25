.PHONY: all clean

OPENTITAN_DIR ?= ./opentitan

all:
	$(OPENTITAN_DIR)/util/ipgen.py generate -C $(OPENTITAN_DIR)/hw/ip_templates/rv_plic \
        -c rv_plic.ipconfig.hjson -o rv_plic/; mkdir -p rtl/ ;\
		mv rv_plic/rtl/* rtl/; rm -rf rv_plic/
	cp $(OPENTITAN_DIR)/hw/ip/prim_generic/rtl/prim_generic_buf.sv rtl/prim_buf.sv
	cp $(OPENTITAN_DIR)/hw/ip/prim_generic/rtl/prim_generic_flop_2sync.sv rtl/prim_flop_2sync.sv
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_subreg_arb.sv rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim_generic/rtl/prim_generic_flop.sv rtl/prim_flop.sv
	git apply patch/rv_plic.patch

clean:
	rm -rf rtl/
