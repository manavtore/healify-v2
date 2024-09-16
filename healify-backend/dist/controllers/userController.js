"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteUser = exports.updateUser = exports.getUser = exports.createUser = void 0;
const database_1 = __importDefault(require("../config/database"));
const createUser = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const user = yield database_1.default.user.create({
            data: {
                name: req.body.name,
                username: req.body.username,
                height: req.body.height,
                weight: req.body.weight,
                age: req.body.age,
                bloodgroup: req.body.bloodgroup,
                gender: req.body.gender,
                address: req.body.address,
                image: req.body.image,
                authId: req.body.authId,
            },
        });
        res.status(201).json(user);
    }
    catch (error) {
        res.status(400).json({ error: "Failed to create user" });
    }
});
exports.createUser = createUser;
const getUser = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const user = yield database_1.default.user.findUnique({
            where: { id: req.params.id },
            include: { records: true },
        });
        if (user) {
            res.json(user);
        }
        else {
            res.status(404).json({ error: "User not found" });
        }
    }
    catch (error) {
        res.status(400).json({ error: "Failed to get user" });
    }
});
exports.getUser = getUser;
const updateUser = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const user = yield database_1.default.user.update({
            where: { id: req.params.id },
            data: req.body,
        });
        res.json(user);
    }
    catch (error) {
        res.status(400).json({ error: "Failed to update user" });
    }
});
exports.updateUser = updateUser;
const deleteUser = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield database_1.default.user.delete({
            where: { id: req.params.id },
        });
        res.status(204).send();
    }
    catch (error) {
        res.status(400).json({ error: "Failed to delete user" });
    }
});
exports.deleteUser = deleteUser;
