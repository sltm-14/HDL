library verilog;
use verilog.vl_types.all;
entity mux_param is
    port(
        datain          : in     vl_logic_vector(3 downto 0);
        \select\        : in     vl_logic_vector(1 downto 0);
        sltd_o          : out    vl_logic_vector(5 downto 0)
    );
end mux_param;
