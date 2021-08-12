library verilog;
use verilog.vl_types.all;
entity add_condition is
    port(
        i_hto           : in     vl_logic_vector(13 downto 0);
        o_hto           : out    vl_logic_vector(13 downto 0)
    );
end add_condition;
