With ECMAScript5's Function.prototype.bind things get pretty clean:

function newCall(Cls) {
    return new (Function.prototype.bind.apply(Cls, arguments));
    // or even
    // return new (Cls.bind.apply(Cls, arguments));
    // if you know that Cls.bind has not been overwritten
}

var s = newCall(Something, a, b, c);

var s = new (Function.prototype.bind.call(Something, null, a, b, c));

var s = new (Function.prototype.bind.apply(Something, [null, a, b, c]));


