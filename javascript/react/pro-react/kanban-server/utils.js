"use strict";
let sendResponse = function (res, next) {
    return (obj) => {
        res.send(200, obj);
        next();
    };
};
exports.sendResponse = sendResponse;
let sendError = function (next) {
    return (err) => {
        console.log(err);
        next(err);
    };
};
exports.sendError = sendError;
//# sourceMappingURL=utils.js.map