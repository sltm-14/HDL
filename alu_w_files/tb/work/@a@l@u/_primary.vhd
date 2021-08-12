library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        A_i             : in     vl_logic_vector(3 downto 0);
        B_i             : in     vl_logic_vector(3 downto 0);
        opSel           : in     vl_logic_vector(2 downto 0);
        o_alu           : out    vl_logic_vector(7 downto 0)
    );
end ALU;
