var app = require("express")();
var http = require("http").createServer(app);
var io = require("socket.io")(http);
var mysql = require("mysql");
const path = require("path");
var sha1 = require("sha1");
var moment = require("moment");
var bodyParser = require("body-parser");
const multer = require("multer");

// database connection
var con = mysql.createConnection({
  host: "localhost",
  user: "ranaentp_latest_findme",
  password: "0=,gdNCg2z$s",
  database: "ranaentp_latest_findme",
});
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const formData = require("express-form-data");
const { stat } = require("fs");
const { resolve } = require("path");
app.use(formData.parse());
/// multer configuration
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "../uploads");
  },
  filename: (req, file, cb) => {
    console.log(file);
    cb(
      null,
      Date.now() +
        path.extname(file.originalname + "." + file.mimetype.split("/")[1])
    );
  },
});
const fileFilter = (req, file, cb) => {
  if (file.mimetype == "image/jpeg" || file.mimetype == "image/png") {
    cb(null, true);
  } else {
    cb(null, false);
  }
};
var upload = multer({ storage, fileFilter });

//Post SIGNUP
app.post("/api/signup", (req, res) => {
  var phone_no = req.body.phone_no;
  var password = sha1(req.body.password);
  var f_name = req.body.f_name;
  var l_name = req.body.l_name;
  var country = "";

  if (phone_no && password && f_name && l_name) {
    var user_exists = "select * from users where phone_no='" + phone_no + "'";
    let query_execute = con.query(user_exists, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        return res.send(
          JSON.stringify({
            status: true,
            message: "Record already exist",
            data: "",
          })
        );
      } else {
        let data = {
          f_name: f_name,
          l_name: l_name,
          password: password,
          user_status: 0,

          joining_date: new Date(),
          phone_no: phone_no,
        };

        let sql = "INSERT INTO users SET ?";

        let query = con.query(sql, data, (err, results) => {
          if (err) throw err;
          let last_id = results.insertId;
          let getUser = "SELECT * FROM users WHERE u_id='" + last_id + "'";
          let getLastUser = con.query(getUser, (err, result) => {
            if (err) throw err;
            res.send(
              JSON.stringify({
                status: true,
                message: "data inserted",
                data: results,
              })
            );
          });
        });
      }
    });
  } else {
    console.log(false);
  }
});

//Post LOGIN
app.post("/api/login_user", (req, res) => {
  var phone_no = req.body.phone_no;
  var password = req.body.password;

  if (phone_no && password) {
    let sql =
      "SELECT * FROM users where phone_no ='" +
      phone_no +
      "' AND password='" +
      sha1(password) +
      "'";

    let query = con.query(sql, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        res.send(
          JSON.stringify({
            status: true,
            message: "data found",
            data: results[0],
          })
        );
      } else {
        res.send(
          JSON.stringify({
            status: false,
            message: "Incorrect Email or Password",
            data: results,
          })
        );
      }
    });
  } else {
    console.log(false);
  }
});

//Post Chnage password
app.post("/api/changepassword", (req, res) => {
  var phone_no = req.body.phone_no;
  var password = req.body.password;

  if (phone_no && password) {
    let sql = "select * from users where phone_no='" + phone_no + "'";

    let query = con.query(sql, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        let sql_update =
          "UPDATE users SET password='" +
          sha1(password) +
          "' WHERE u_id=" +
          results[0].u_id;
        let updateq = con.query(sql_update, (err, results) => {
          if (err) throw err;
          res.send(
            JSON.stringify({
              status: true,
              message: "Password Changed,Login now",
              data: "",
            })
          );
        });
      } else {
        res.send(
          JSON.stringify({
            status: false,
            message: "No Record exit.",
            data: "",
          })
        );
      }
    });
  } else {
    console.log(false);
  }
});

//Post get type of services
app.post("/api/get_type_of_work", (req, res) => {
  let sql = "select * from type_of_service where type='" + 0 + "'";

  let query = con.query(sql, (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      res.send(
        JSON.stringify({
          status: true,
          message: "Record Found",
          data: results,
        })
      );
    } else {
      res.send(
        JSON.stringify({
          status: false,
          message: "No Record exit.",
          data: "",
        })
      );
    }
  });
});
//Post get type of services
app.post("/api/GetBusinessType", (req, res) => {
  let sql = "select * from type_of_service where type='" + 1 + "'";

  let query = con.query(sql, (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      res.send(
        JSON.stringify({
          status: true,
          message: "Record Found",
          data: results,
        })
      );
    } else {
      res.send(
        JSON.stringify({
          status: false,
          message: "No Record exit.",
          data: "",
        })
      );
    }
  });
});
//Post send message
app.post("/api/SendMsg", (req, res) => {
  var u_id = req.body.u_id;
  var recver_id = req.body.recver_id;
  var content = req.body.content;
  let data = {
    recv_id: recver_id,
    send_id: u_id,
    content: content,
    date: new Date(),
  };
  if (recver_id && u_id && content) {
    let sql = "INSERT INTO msgs SET ?";
    let query = con.query(sql, data, (err, result) => {
      if (err) throw err;
      res.send(
        JSON.stringify({ status: true, message: "message sent", data: "" })
      );
    });
  } else {
    res.send(
      JSON.stringify({
        status: false,
        message: "Something is missing",
        data: "",
      })
    );
  }
});

//Post delete activity
app.post("/api/DeleteActivity", (req, res) => {
  var work_id = req.body.work_id;
  if (work_id) {
    let sql = "SELECT *  FROM works WHERE work_id='" + work_id + "'";
    let query_check = con.query(sql, (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        let sql_delete =
          "DELETE FROM works WHERE work_id='" + result[0].work_id + "'";
        let delete_query = con.query(sql_delete, (err, delteRes) => {
          if (err) throw err;
          res.send(
            JSON.stringify({
              status: true,
              message: "Record Deleted",
              data: "",
            })
          );
        });
      } else {
        res.send(
          JSON.stringify({
            status: false,
            message: "No Record Found",
            data: "",
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: false,
        message: "Something is missing",
        data: "",
      })
    );
  }
});

//Post get my business
app.post("/api/get_my_business", (req, res) => {
  var u_id = req.body.u_id;
  console.log("zaid", req.body);
  if (u_id) {
    let sql = "SELECT * FROM services WHERE u_id='" + u_id + "'";
    let query_check = con.query(sql, (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        res.send(
          JSON.stringify({
            status: true,
            message: "All Activities.",
            data: result,
          })
        );
      } else {
        res.send(
          JSON.stringify({
            status: true,
            message: "No record found.",
            data: "",
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: true,
        message: "Something is missing",
        data: "",
      })
    );
  }
});

//Post delete business post
app.post("/api/delete_business", (req, res) => {
  var service_id = req.body.service_id;
  if (service_id) {
    let sql = "SELECT * FROM services WHERE service_id='" + service_id + "'";
    // let sql = "DELETE FROM services WHERE service_id='" + service_id + "'";
    let query_check = con.query(sql, (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        let delete_sql =
          "DELETE FROM services WHERE service_id='" +
          result[0].service_id +
          "'";
        let delete_query = con.query(delete_sql, (err, result) => {
          if (err) throw err;
        });
        res.send(
          JSON.stringify({ status: true, message: "Record Deleted", data: "" })
        );
      } else {
        res.send(
          JSON.stringify({ status: true, message: "No Record Found", data: "" })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: true,
        message: "Something is missing",
        data: "",
      })
    );
  }
});

//Post delete conversation
app.post("/api/DeleteConvo", (req, res) => {
  var u_id = req.body.u_id;
  var recver_id = req.body.recver_id;
  if (u_id && recver_id) {
    let sql = "SELECT * FROM users WHERE u_id='" + u_id + "'";

    let query_check = con.query(sql, (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        let delete_sql =
          "delete from msgs where recv_id='" +
          u_id +
          "' and send_id='" +
          recver_id +
          "' ";
        let delete_sql1 =
          "delete from msgs where recv_id='" +
          recver_id +
          "' and send_id='" +
          u_id +
          "'";
        let delete_query = con.query(delete_sql, (err, result) => {
          if (err) throw err;
        });

        let delete_query1 = con.query(delete_sql1, (err, result) => {
          if (err) throw err;
          res.send(
            JSON.stringify({
              status: true,
              message: "Record Deleted",
              data: "",
            })
          );
        });
      } else {
        res.send(
          JSON.stringify({ status: true, message: "No Record Found", data: "" })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: true,
        message: "Something is missing",
        data: "",
      })
    );
  }
});

//Post update status
app.post("/api/UpdateStatus", (req, res) => {
  var service_id = req.body.service_id;
  var status = req.body.status;

  if (service_id && status) {
    let sql = "SELECT * FROM services WHERE service_id='" + service_id + "'";
    let query_check = con.query(sql, (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        let update_sql =
          "UPDATE services set status='" +
          status +
          "' WHERE service_id='" +
          service_id +
          "'";
        let update_query = con.query(update_sql, (err, result) => {
          if (err) throw err;
        });
        res.send(
          JSON.stringify({ status: true, message: "Record Updated", data: "" })
        );
      } else {
        res.send(
          JSON.stringify({ status: true, message: "No Record Found", data: "" })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: true,
        message: "Something is missing",
        data: "",
      })
    );
  }
});

/// Conversation API
app.post("/api/MyAllMsgs", (req, res, next) => {
  var u_id = req.body.u_id;
  if (u_id) {
    let sql = "SELECT * FROM users where u_id ='" + u_id + "'";
    let query = con.query(sql, (err, results) => {
      if (err) throw err;

      if (results.length > 0) {
        let sql =
          "SELECT msgs.*,users.dp,f_name,l_name FROM msgs LEFT join users ON CASE WHEN(recv_id = '" +
          u_id +
          "') THEN(users.u_id=send_id) WHEN(send_id='" +
          u_id +
          "') then(users.u_id=recv_id) end WHERE msg_id IN(SELECT MAX(msg_id) FROM msgs WHERE send_id='" +
          u_id +
          "' OR recv_id = '" +
          u_id +
          "' GROUP BY CASE WHEN(send_id='" +
          u_id +
          "') THEN(recv_id)WHEN(recv_id='" +
          u_id +
          "') THEN(send_id)END) ORDER BY msg_id DESC";

        let query = con.query(sql, (err, userchat) => {
          if (err) throw err;
          if (userchat.length > 0) {
            res.send(
              JSON.stringify({
                status: true,
                message: "User Conversation",
                data: userchat,
              })
            );
          } else {
            res.send(
              JSON.stringify({
                status: false,
                message: "User Conversation not found!",
                data: [],
              })
            );
          }
        });
      } else {
        res.send(
          JSON.stringify({
            status: false,
            message: "Something is missing",
            data: results,
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({ status: false, message: "Un athorized user", data: "" })
    );
  }
});
/// Conversation API
app.post("/api/Convo", (req, res, next) => {
  var u_id = req.body.u_id;
  var recver_id = req.body.recver_id;
  if (u_id && recver_id) {
    let getUser = "SELECT * FROM users where u_id ='" + recver_id + "'";

    let query = con.query(getUser, (err, results) => {
      if (err) throw err;

      let resOjb = results[0];
      username = resOjb.f_name + " " + resOjb.l_name;
      if (results.length > 0) {
        query_msgs =
          // "select msgs.* from msgs where recv_id='" +
          // u_id +
          // "' and send_id='" +
          // recver_id +
          // "'  union select msgs.* from msgs where recv_id='" +
          // recver_id +
          // "' and send_id='" +
          // u_id +
          // "' order by date asc";
          "select msgs.* from msgs where (recv_id='" +
          u_id +
          "' and send_id='" +
          recver_id +
          "' ) or (recv_id='" +
          recver_id +
          "' and send_id='" +
          u_id +
          "' ) order by msg_id asc";
        let query = con.query(query_msgs, (err, userchat) => {
          if (err) throw err;
          if (userchat.length > 0) {
            res.send(
              JSON.stringify({
                status: true,
                message: "User Conversation",
                data: userchat,
              })
            );
          } else {
            res.send(
              JSON.stringify({
                status: false,
                message: "User Conversation not found!",
                data: [],
              })
            );
          }
        });
      } else {
        res.send(
          JSON.stringify({
            status: false,
            message: "Something is missing",
            data: results,
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({ status: false, message: "Un athorized user", data: "" })
    );
  }
});
// //add_business
app.post("/api/add_business", upload.single("image"), (req, res) => {
  console.log("Zaid", req.body, req.files);
  let user_query = "SELECT * FROM users WHERE u_id='" + req.body.u_id + "'";
  let check_user = con.query(user_query, (err, result) => {
    if (result.length > 0) {
      let data = {
        register_for: req.body.register_for,
        business_name: req.body.business_name,
        phone_no: req.body.phone_no,
        type_of_work: req.body.type_of_work,
        business_details: req.body.business_details,
        image: "uploads/" + req.filename,
        business_lat: req.body.business_lat,
        business_long: req.body.business_long,
        experience: req.body.experience,
        u_id: req.body.u_id,
      };
      let sql = "INSERT INTO services SET ?";
      let query = con.query(sql, data, (err, results) => {
        if (err) throw err;
        let tags1 = JSON.parse(req.body.tags);

        let service_id = results.insertId;

        let updateTags = tags1.map((item) => {
          return { service_id: service_id, tag_name: item };
        });
        let tags_query = "INSERT INTO tags SET ?";
        let tags_query_check = con.query(
          tags_query,
          updateTags,
          (err, results) => {
            if (err) throw err;
            res.send(
              JSON.stringify({
                status: "true",
                message: "Record Inserted",
                data: "",
              })
            );
          }
        );
      });
    } else {
      res.send(
        JSON.stringify({ status: "true", message: "No user found", data: "" })
      );
    }
  });
});

//add_work
app.post("/api/add_work", upload.single("image"), (req, res) => {
  let user_query = "SELECT * FROM users WHERE u_id='" + req.body.u_id + "'";
  let check_user = con.query(user_query, (err, result) => {
    if (result.length > 0) {
      let data = {
        looking_for: req.body.looking_for,
        title: req.body.title,
        job_details: req.body.job_details,
        tags: req.body.tags,
        phone_no: req.body.phone_no,
        lat: req.body.lat,
        longi: req.body.longi,
        image: "uploads/" + req.filename,
        date: new Date(),
        u_id: req.body.u_id,
      };
      let sql = "INSERT INTO works SET ?";
      let query = con.query(sql, data, (err, results) => {
        if (err) throw err;
        res.send(
          JSON.stringify({
            status: "true",
            message: "Record Inserted",
            data: "",
          })
        );
      });
    } else {
      res.send(
        JSON.stringify({ status: "true", message: "No user found", data: "" })
      );
    }
  });
});

//Post get my activities
app.post("/api/myactivities", (req, res) => {
  var u_id = req.body.u_id;
  let sql = "select * from users where u_id='" + u_id + "'";

  let query = con.query(sql, (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      var activities_query =
        "select * from works where works.u_id='" + u_id + "'";
      let run_query = con.query(activities_query, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
          res.send(
            JSON.stringify({
              status: true,
              message: "Record Found",
              data: results,
            })
          );
        } else {
          res.send(
            JSON.stringify({
              status: true,
              message: "No Record Found",
              data: "",
            })
          );
        }
      });
    } else {
      res.send(
        JSON.stringify({
          status: false,
          message: "No user found.",
          data: "",
        })
      );
    }
  });
});

//Post get job detail
app.post("/api/job_detail", (req, res) => {
  var work_id = req.body.work_id;
  if (work_id) {
    var job_query =
      "select works.*,users.f_name,users.l_name from works inner join users on users.u_id=works.u_id where work_id='" +
      work_id +
      "'";

    let run_query = con.query(job_query, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        res.send(
          JSON.stringify({
            status: true,
            message: "Record Found",
            data: results,
          })
        );
      } else {
        res.send(
          JSON.stringify({
            status: true,
            message: "No Record Found",
            data: "",
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: false,
        message: "Somthing is missing.",
        data: "",
      })
    );
  }
});

//Post get job in area
app.post("/api/jobsInArea", (req, res) => {
  var lat = req.body.lat;
  var long = req.body.long;
  if (lat && long) {
    var job_query =
      "select works.*,users.* from works inner join users on users.u_id=works.u_id";

    let run_query = con.query(job_query, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        res.send(
          JSON.stringify({
            status: true,
            message: "Record Found",
            data: results,
          })
        );
      } else {
        res.send(
          JSON.stringify({
            status: true,
            message: "No Record Found",
            data: "",
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: false,
        message: "Somthing is missing.",
        data: "",
      })
    );
  }
});
//Post professional in area
app.post("/api/professionalInArea", (req, res) => {
  var lat = req.body.lat;
  var long = req.body.long;
  if (lat && long) {
    var job_query =
      "select services.*,type_of_service.service_name from services inner join type_of_service on type_of_service.service_id=services.type_of_work where type_of_service.type='0'";

    let run_query = con.query(job_query, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        res.send(
          JSON.stringify({
            status: true,
            message: "Record Found",
            data: results,
          })
        );
      } else {
        res.send(
          JSON.stringify({
            status: true,
            message: "No Record Found",
            data: "",
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: false,
        message: "Somthing is missing.",
        data: "",
      })
    );
  }
});
//Post search service post
app.post("/api/business_detail", (req, res) => {
  var service_id = req.body.service_id;
  if (service_id) {
    var service_query =
      "select type_of_service.*,services.* from services inner join type_of_service on type_of_service.service_id=services.type_of_work where services.service_id='" +
      service_id +
      "'";

    let run_query = con.query(service_query, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        res.send(
          JSON.stringify({
            status: true,
            message: "Record Found",
            data: results,
          })
        );
      } else {
        res.send(
          JSON.stringify({
            status: true,
            message: "No Record Found",
            data: "",
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: false,
        message: "Somthing is missing.",
        data: "",
      })
    );
  }
});

//Post get job detail
app.post("/api/search_service", (req, res) => {
  var txt = req.body.txt;
  var lat = req.body.lat;
  var long = req.body.long;
  if (txt) {
    var searc_query =
      "select * from tags inner join services on services.service_id=tags.service_id where tag_name like '%" +
      txt +
      "%'";
    let run_query = con.query(searc_query, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        res.send(
          JSON.stringify({
            status: true,
            message: "Record Found",
            data: results,
          })
        );
      } else {
        res.send(
          JSON.stringify({
            status: false,
            message: "No Record Found",
            data: [],
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: false,
        message: "Somthing is missing.",
        data: [],
      })
    );
  }
});

//Post serach work post
app.post("/api/search_work", (req, res) => {
  var txt = req.body.txt;
  var lat = req.body.lat;
  var long = req.body.long;

  var searc_query =
    "select * from works inner join type_of_service on type_of_service.service_id=works.looking_for where type_of_service.service_name like '%" +
    txt +
    "%'";
  let run_query = con.query(searc_query, (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      res.send(
        JSON.stringify({
          status: true,
          message: "Record Found",
          data: results,
        })
      );
    } else {
      res.send(
        JSON.stringify({
          status: false,
          message: "No Record Found",
          data: [],
        })
      );
    }
  });
});

//Post serach result post
app.post("/api/search_result", (req, res) => {
  var txt = req.body.txt;

  if (txt) {
    var searc_query =
      "select services.*,type_of_service.service_name from services inner join type_of_service on type_of_service.service_id=services.type_of_work where service_name like '%" +
      txt +
      "%'";
    let run_query = con.query(searc_query, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        res.send(
          JSON.stringify({
            status: true,
            message: "Record Found",
            data: results,
          })
        );
      } else {
        res.send(
          JSON.stringify({
            status: false,
            message: "No Record Found",
            data: [],
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: false,
        message: "Somthing is missing.",
        data: "",
      })
    );
  }
});
//Post serach result post
app.post("/api/SearchTasks", (req, res) => {
  var txt = req.body.txt;
  var lat = req.body.lat;
  var long = req.body.long;
  if (txt) {
    var searc_query = "select * from works  where tags like '%" + txt + "%'";
    let run_query = con.query(searc_query, (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        res.send(
          JSON.stringify({
            status: true,
            message: "Record Found",
            data: results,
          })
        );
      } else {
        res.send(
          JSON.stringify({
            status: false,
            message: "No Record Found",
            data: [],
          })
        );
      }
    });
  } else {
    res.send(
      JSON.stringify({
        status: false,
        message: "Somthing is missing.",
        data: [],
      })
    );
  }
});
//Post serach result post
app.post("/api/professionalInAreaMapbox", (req, res) => {
  var u_id = req.body.u_id;
  var lat = req.body.lat;
  var long = req.body.long;
  var txt = req.body.txt;
  let sql;
  if (!txt) {
    sql = "select * from services";
  } else {
    if (u_id) {
      let array = { name: txt, date: new Date(), u_id: u_id, status: 0 };
      sql = "INSERT INTO RecentSearches SET ?";
      let run_query = con.query(sql, array, (err, result) => {
        if (err) throw err;
      });
    }

    sql =
      "select * from services inner join type_of_service on type_of_service.service_id=type_of_work where service_name='" +
      txt +
      "'union select * from services inner join tags on services.service_id=tags.service_id where tag_name='" +
      txt +
      "'";
  }
  let query_check = con.query(sql, (err, result) => {
    if (err) throw err;
    res.send(
      JSON.stringify({
        status: true,
        message: "Service List.",
        data: result,
      })
    );
  });
});
//Post WorkInAreaMapbox
app.post("/api/WorkInAreaMapbox", (req, res) => {
  var u_id = req.body.u_id;
  var lat = req.body.lat;
  var long = req.body.long;
  var txt = req.body.txt;
  let sql;
  if (!txt) {
    sql = "select * from services";
  } else {
    if (u_id) {
      let array = { name: txt, date: new Date(), u_id: u_id, status: 0 };
      sql = "INSERT INTO RecentSearches SET ?";
      let run_query = con.query(sql, array, (err, result) => {
        if (err) throw err;
      });
    }

    sql =
      "select * from services inner join type_of_service on type_of_service.service_id=type_of_work where service_name='" +
      txt +
      "'union select * from services inner join tags on services.service_id=tags.service_id where tag_name='" +
      txt +
      "'";
  }
  let query_check = con.query(sql, (err, result) => {
    if (err) throw err;
    res.send(
      JSON.stringify({
        status: true,
        message: "Service List.",
        data: result,
      })
    );
  });
});
app.get("/", function (req, res) {
  res.sendFile(__dirname + "/index.html");
});
//var room = [];
io.on("connection", (socket) => {
  var device = socket.handshake.query.device;
  var role = socket.handshake.query.role;
  var userid = socket.handshake.query.userid;

  console.log(" User " + userid + " is connected Role is " + role);
  socket.join("myRoom_" + userid);
  console.log("Room " + "myRoom_" + userid + "Joined");

  socket.on("send_message", (msg) => {
    var otherRoom = "myRoom_" + msg.recver_id;
    socket.join(otherRoom);
    let data = {
      recv_id: msg.recver_id,
      send_id: msg.send_id,
      content: msg.content,
      date: new Date(),
    };
    console.log("data", data);
    let sql = "INSERT INTO msgs SET ?";
    let query = con.query(sql, data, (err, result) => {
      console.log(result);
      if (err) throw err;
      // console.log(result);
      // io.to(otherRoom).emit("receive_msg", {
      //   msg_id: result.insertId,
      //   recv_id: msg.recver_id,
      //   send_id: msg.send_id,
      //   content: msg.content,
      //   date: new Date(),
      // });
      sql1 = "SELECT * FROM msgs WHERE msg_id='" + result.insertId + "'";
      let sql_query = con.query(sql1, (err, res) => {
        console.log(sql);
        if (err) throw err;
        io.to(otherRoom).emit("receive_msg", res[0]);
      });
    });
  });

  //   socket.to(room).emit("receive_msg", "test");

  //   socket.on("send_message", (userdata) => {
  //       var room = Math.random();
  //   socket.join(room);
  //       socket.to(room).emit("receive_msg", "test");

  //       console.log("user data====>", userdata);
  //     // var otherRoom = "chat_room" + userdata.recver_id;
  //  socket.join(otherRoom);
  // io.to(otherRoom).emit("receive_msg", userdata);
  //  });

  // socket.on("send_message", (userdata) => {
  //   var otherRoom = "myRoom_" + userdata.recver_id;
  //   socket.join(otherRoom);
  //   console.log(" In Chat Room " + "myRoom_" + otherRoom + " Joined for Chat");
  //   console.log(userdata);
  //   io.to(otherRoom).emit("receive_msg", userdata);
  //   //var myRoom = "chat_room" + userdata.send_id;
  //   //io.to(otherRoom).emit("receive_msg", userdata);
  // });

  socket.on("disconnect", () => {
    console.log(
      "user disconnected via " + device + " and userid is : " + userid
    );
  });
});

http.listen(3010, () => {
  console.log("listening on *:3010");
});
