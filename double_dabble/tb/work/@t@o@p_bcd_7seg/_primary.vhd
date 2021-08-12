library verilog;
use verilog.vl_types.all;
entity TOP_bcd_7seg is
    port(
        in_Bin          : in     vl_logic_vector(5 downto 0);
        out_O           : out    vl_logic_vector(6 downto 0);
        out_T           : out    vl_logic_vector(6 downto 0)
    );
end TOP_bcd_7seg;
