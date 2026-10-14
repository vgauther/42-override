function signedChar(x) {        // emulate (signed char) cast
  return x >= 128 ? x - 256 : x;
}

function genSerial(login) {
  const b = Buffer.from(login, "latin1");   // raw bytes
  if (b.length <= 5) throw new Error("login must be longer than 5 chars");
  for (const c of b) if (c <= 0x1f) throw new Error("every char must be > 0x1f");

  // seed = ((signed char)login[3] ^ 0x1337) + 0x5eeded
  let h = ((signedChar(b[3]) ^ 0x1337) + 0x5eeded) >>> 0;

  // per-char: h += ((int)(signed char)c ^ h) % 1337
  for (const ch of b) {
    const c = signedChar(ch) >>> 0;
    h = (h + (((c ^ h) >>> 0) % 1337)) >>> 0;
  }
  return h >>> 0;
} 

const login = process.argv[2] || "AAAAAA";
console.log("login :", login);
console.log("serial:", genSerial(login));