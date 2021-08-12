library verilog;
use verilog.vl_types.all;
entity bin_to_ot is
    port(
        i_Bin           : in     vl_logic_vector(5 downto 0);
        o_Tens          : out    vl_logic_vector(3 downto 0);
        o_Ones          : out    vl_logic_vector(3 downto 0)
    );
end bin_to_ot;
