class AsmInstruction<dag outs, dag ins, string asmstring, list<dag> pattern> :
EraVMInstruction<outs, ins, 8, asmstring, pattern> {
  string BaseOpcode;
  bit IsLegacy = 0;
  bit IsPseudoArith = 0;
  let isPseudo = 0;
  bit isCodeGenOnly = 0;
}

class InAddressMode<bits<3> val> {
  bits<3> Value = val;
}
class InReg<bits<4> reg>: InAddressMode<0> {
     bits<4> RegNum = reg;
}
foreach i = 0-15 in {
  def InRegR#i : InReg<i>;
}

def InImm: InAddressMode<1>;
// def InStack: InAddressMode<2>;
// def InCode: InAddressMode<3>;

class HasIn1Any {
      field InAddressMode In1;
}

let BaseOpcode = ADDrrr_s.BaseOpcode in
def AsmAdd : AsmInstruction<(outs GR256:$dst0), (ins GR256:$src0, GR256:$src1),"NEWadd",[]>, Migration;


def getNewOpcode: InstrMapping {
  let FilterClass = "Migration";
  let RowFields = ["BaseOpcode"];
  let ColFields = ["IsLegacy"];
  let KeyCol = ["1"];
  let ValueCols = [["0"]];
}

// def getAddressMode: InstrMapping {
//   let FilterClass = "AsmInstruction";
//   let RowFields = ["BaseOpcode"];
//   let ColFields = [""];
//   let KeyCol = ["1"];
//   let ValueCols = [["0"]];
// }
