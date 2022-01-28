.PHONY: all clean

OPENTITAN_DIR ?= ./opentitan

all:
	$(OPENTITAN_DIR)/util/ipgen.py generate -C $(OPENTITAN_DIR)/hw/ip_templates/rv_plic \
        -c rv_plic.ipconfig.hjson -o rv_plic/; mkdir -p rtl/ ;\
		mv rv_plic/rtl/* rtl/; rm -rf rv_plic/
	cp $(OPENTITAN_DIR)/hw/top_earlgrey/rtl/top_pkg.sv               rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_alert_pkg.sv             rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_secded_pkg.sv            rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_subreg_pkg.sv            rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_mubi_pkg.sv              rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_subreg.sv                rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_subreg_ext.sv            rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_alert_sender.sv          rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_secded_inv_64_57_dec.sv  rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_secded_inv_64_57_enc.sv  rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_sec_anchor_buf.sv        rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_sec_anchor_flop.sv       rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_diff_decode.sv           rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_secded_inv_39_32_enc.sv  rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_secded_inv_39_32_dec.sv  rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_pkg.sv                   rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_cmd_intg_gen.sv          rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_cmd_intg_chk.sv          rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_rsp_intg_chk.sv          rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_rsp_intg_gen.sv          rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_adapter_reg.sv           rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_err.sv                   rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_data_integ_enc.sv        rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_data_integ_dec.sv        rtl/
	cp $(OPENTITAN_DIR)/hw/ip/tlul/rtl/tlul_adapter_host.sv          rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_assert.sv                rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim_generic/rtl/prim_generic_buf.sv rtl/prim_buf.sv
	cp $(OPENTITAN_DIR)/hw/ip/prim_generic/rtl/prim_generic_flop_2sync.sv rtl/prim_flop_2sync.sv
	cp $(OPENTITAN_DIR)/hw/ip/prim/rtl/prim_subreg_arb.sv rtl/
	cp $(OPENTITAN_DIR)/hw/ip/prim_generic/rtl/prim_generic_flop.sv rtl/prim_flop.sv
	git apply patch/rv_plic.patch

clean:
	rm -rf rtl/
