part of plusdomains_v1_api;

class ActivitiesResource_ {

  final Client _client;

  ActivitiesResource_(Client client) :
      _client = client;

  /**
   * Get an activity.
   *
   * [activityId] - The ID of the activity to get.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Activity> get(core.String activityId, {core.Map optParams}) {
    var url = "activities/{activityId}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (activityId == null) paramErrors.add("activityId is required");
    if (activityId != null) urlParams["activityId"] = activityId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Activity.fromJson(data));
  }

  /**
   * Create a new activity for the authenticated user.
   *
   * [request] - Activity to send in this request
   *
   * [userId] - The ID of the user to create the activity on behalf of. Its value should be "me", to indicate the authenticated user.
   *
   * [preview] - If "true", extract the potential media attachments for a URL. The response will include all possible attachments for a URL, including video, photos, and articles based on the content of the page.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Activity> insert(Activity request, core.String userId, {core.bool preview, core.Map optParams}) {
    var url = "people/{userId}/activities";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (preview != null) queryParams["preview"] = preview;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Activity.fromJson(data));
  }

  /**
   * List all of the activities in the specified collection for a particular user.
   *
   * [userId] - The ID of the user to get activities for. The special value "me" can be used to indicate the authenticated user.
   *
   * [collection] - The collection of activities to list.
   *   Allowed values:
   *     user - All activities created by the specified user that the authenticated user is authorized to view.
   *
   * [maxResults] - The maximum number of activities to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
   *   Default: 20
   *   Minimum: 1
   *   Maximum: 100
   *
   * [pageToken] - The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<ActivityFeed> list(core.String userId, core.String collection, {core.int maxResults, core.String pageToken, core.Map optParams}) {
    var url = "people/{userId}/activities/{collection}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (collection == null) paramErrors.add("collection is required");
    if (collection != null && !["user"].contains(collection)) {
      paramErrors.add("Allowed values for collection: user");
    }
    if (collection != null) urlParams["collection"] = collection;
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new ActivityFeed.fromJson(data));
  }
}

class AudiencesResource_ {

  final Client _client;

  AudiencesResource_(Client client) :
      _client = client;

  /**
   * List all of the audiences to which a user can share.
   *
   * [userId] - The ID of the user to get audiences for. The special value "me" can be used to indicate the authenticated user.
   *
   * [maxResults] - The maximum number of circles to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
   *   Default: 20
   *   Minimum: 1
   *   Maximum: 100
   *
   * [pageToken] - The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<AudiencesFeed> list(core.String userId, {core.int maxResults, core.String pageToken, core.Map optParams}) {
    var url = "people/{userId}/audiences";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new AudiencesFeed.fromJson(data));
  }
}

class CirclesResource_ {

  final Client _client;

  CirclesResource_(Client client) :
      _client = client;

  /**
   * Add a person to a circle. Google+ limits certain circle operations, including the number of circle adds. Learn More.
   *
   * [circleId] - The ID of the circle to add the person to.
   *
   * [email] - Email of the people to add to the circle. Optional, can be repeated.
   *   Repeated values: allowed
   *
   * [userId] - IDs of the people to add to the circle. Optional, can be repeated.
   *   Repeated values: allowed
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Circle> addPeople(core.String circleId, {core.List<core.String> email, core.List<core.String> userId, core.Map optParams}) {
    var url = "circles/{circleId}/people";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (circleId == null) paramErrors.add("circleId is required");
    if (circleId != null) urlParams["circleId"] = circleId;
    if (email != null) queryParams["email"] = email;
    if (userId != null) queryParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "PUT", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Circle.fromJson(data));
  }

  /**
   * Get a circle.
   *
   * [circleId] - The ID of the circle to get.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Circle> get(core.String circleId, {core.Map optParams}) {
    var url = "circles/{circleId}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (circleId == null) paramErrors.add("circleId is required");
    if (circleId != null) urlParams["circleId"] = circleId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Circle.fromJson(data));
  }

  /**
   * Create a new circle for the authenticated user.
   *
   * [request] - Circle to send in this request
   *
   * [userId] - The ID of the user to create the circle on behalf of. The value "me" can be used to indicate the authenticated user.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Circle> insert(Circle request, core.String userId, {core.Map optParams}) {
    var url = "people/{userId}/circles";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Circle.fromJson(data));
  }

  /**
   * List all of the circles for a user.
   *
   * [userId] - The ID of the user to get circles for. The special value "me" can be used to indicate the authenticated user.
   *
   * [maxResults] - The maximum number of circles to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
   *   Default: 20
   *   Minimum: 1
   *   Maximum: 100
   *
   * [pageToken] - The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<CircleFeed> list(core.String userId, {core.int maxResults, core.String pageToken, core.Map optParams}) {
    var url = "people/{userId}/circles";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new CircleFeed.fromJson(data));
  }

  /**
   * Update a circle's description. This method supports patch semantics.
   *
   * [request] - Circle to send in this request
   *
   * [circleId] - The ID of the circle to update.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Circle> patch(Circle request, core.String circleId, {core.Map optParams}) {
    var url = "circles/{circleId}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (circleId == null) paramErrors.add("circleId is required");
    if (circleId != null) urlParams["circleId"] = circleId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "PATCH", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Circle.fromJson(data));
  }

  /**
   * Delete a circle.
   *
   * [circleId] - The ID of the circle to delete.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> remove(core.String circleId, {core.Map optParams}) {
    var url = "circles/{circleId}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (circleId == null) paramErrors.add("circleId is required");
    if (circleId != null) urlParams["circleId"] = circleId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "DELETE", urlParams: urlParams, queryParams: queryParams);
    return response;
  }

  /**
   * Remove a person from a circle.
   *
   * [circleId] - The ID of the circle to remove the person from.
   *
   * [email] - Email of the people to add to the circle. Optional, can be repeated.
   *   Repeated values: allowed
   *
   * [userId] - IDs of the people to remove from the circle. Optional, can be repeated.
   *   Repeated values: allowed
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> removePeople(core.String circleId, {core.List<core.String> email, core.List<core.String> userId, core.Map optParams}) {
    var url = "circles/{circleId}/people";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (circleId == null) paramErrors.add("circleId is required");
    if (circleId != null) urlParams["circleId"] = circleId;
    if (email != null) queryParams["email"] = email;
    if (userId != null) queryParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "DELETE", urlParams: urlParams, queryParams: queryParams);
    return response;
  }

  /**
   * Update a circle's description.
   *
   * [request] - Circle to send in this request
   *
   * [circleId] - The ID of the circle to update.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Circle> update(Circle request, core.String circleId, {core.Map optParams}) {
    var url = "circles/{circleId}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (circleId == null) paramErrors.add("circleId is required");
    if (circleId != null) urlParams["circleId"] = circleId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "PUT", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Circle.fromJson(data));
  }
}

class CommentsResource_ {

  final Client _client;

  CommentsResource_(Client client) :
      _client = client;

  /**
   * Get a comment.
   *
   * [commentId] - The ID of the comment to get.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Comment> get(core.String commentId, {core.Map optParams}) {
    var url = "comments/{commentId}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (commentId == null) paramErrors.add("commentId is required");
    if (commentId != null) urlParams["commentId"] = commentId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Comment.fromJson(data));
  }

  /**
   * Create a new comment in reply to an activity.
   *
   * [request] - Comment to send in this request
   *
   * [activityId] - The ID of the activity to reply to.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Comment> insert(Comment request, core.String activityId, {core.Map optParams}) {
    var url = "activities/{activityId}/comments";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (activityId == null) paramErrors.add("activityId is required");
    if (activityId != null) urlParams["activityId"] = activityId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Comment.fromJson(data));
  }

  /**
   * List all of the comments for an activity.
   *
   * [activityId] - The ID of the activity to get comments for.
   *
   * [maxResults] - The maximum number of comments to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
   *   Default: 20
   *   Minimum: 0
   *   Maximum: 500
   *
   * [pageToken] - The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
   *
   * [sortOrder] - The order in which to sort the list of comments.
   *   Default: ascending
   *   Allowed values:
   *     ascending - Sort oldest comments first.
   *     descending - Sort newest comments first.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<CommentFeed> list(core.String activityId, {core.int maxResults, core.String pageToken, core.String sortOrder, core.Map optParams}) {
    var url = "activities/{activityId}/comments";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (activityId == null) paramErrors.add("activityId is required");
    if (activityId != null) urlParams["activityId"] = activityId;
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (sortOrder != null && !["ascending", "descending"].contains(sortOrder)) {
      paramErrors.add("Allowed values for sortOrder: ascending, descending");
    }
    if (sortOrder != null) queryParams["sortOrder"] = sortOrder;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new CommentFeed.fromJson(data));
  }
}

class MediaResource_ {

  final Client _client;

  MediaResource_(Client client) :
      _client = client;

  /**
   * Add a new media item to an album. The current upload size limitations are 36MB for a photo and 1GB for a video. Uploads do not count against quota if photos are less than 2048 pixels on their longest side or videos are less than 15 minutes in length.
   *
   * [request] - Media to send in this request
   *
   * [userId] - The ID of the user to create the activity on behalf of.
   *
   * [collection]
   *   Allowed values:
   *     cloud - Upload the media to share on Google+.
   *
   * [content] - Base64 Data of the file content to be uploaded
   *
   * [contentType] - MimeType of the file to be uploaded
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Media> insert(Media request, core.String userId, core.String collection, {core.String content, core.String contentType, core.Map optParams}) {
    var url = "people/{userId}/media/{collection}";
    var uploadUrl = "/upload/plusDomains/v1/people/{userId}/media/{collection}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (collection == null) paramErrors.add("collection is required");
    if (collection != null && !["cloud"].contains(collection)) {
      paramErrors.add("Allowed values for collection: cloud");
    }
    if (collection != null) urlParams["collection"] = collection;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    if (content != null) {
      response = _client.upload(uploadUrl, "POST", request.toString(), content, contentType, urlParams: urlParams, queryParams: queryParams);
    } else {
      response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    }
    return response
      .then((data) => new Media.fromJson(data));
  }
}

class PeopleResource_ {

  final Client _client;

  PeopleResource_(Client client) :
      _client = client;

  /**
   * Get a person's profile.
   *
   * [userId] - The ID of the person to get the profile for. The special value "me" can be used to indicate the authenticated user.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Person> get(core.String userId, {core.Map optParams}) {
    var url = "people/{userId}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Person.fromJson(data));
  }

  /**
   * List all of the people in the specified collection.
   *
   * [userId] - Get the collection of people for the person identified. Use "me" to indicate the authenticated user.
   *
   * [collection] - The collection of people to list.
   *   Allowed values:
   *     circled - The list of people who this user has added to one or more circles.
   *
   * [maxResults] - The maximum number of people to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
   *   Default: 100
   *   Minimum: 1
   *   Maximum: 100
   *
   * [orderBy] - The order to return people in.
   *   Allowed values:
   *     alphabetical - Order the people by their display name.
   *     best - Order people based on the relevence to the viewer.
   *
   * [pageToken] - The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PeopleFeed> list(core.String userId, core.String collection, {core.int maxResults, core.String orderBy, core.String pageToken, core.Map optParams}) {
    var url = "people/{userId}/people/{collection}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (collection == null) paramErrors.add("collection is required");
    if (collection != null && !["circled"].contains(collection)) {
      paramErrors.add("Allowed values for collection: circled");
    }
    if (collection != null) urlParams["collection"] = collection;
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (orderBy != null && !["alphabetical", "best"].contains(orderBy)) {
      paramErrors.add("Allowed values for orderBy: alphabetical, best");
    }
    if (orderBy != null) queryParams["orderBy"] = orderBy;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PeopleFeed.fromJson(data));
  }

  /**
   * List all of the people in the specified collection for a particular activity.
   *
   * [activityId] - The ID of the activity to get the list of people for.
   *
   * [collection] - The collection of people to list.
   *   Allowed values:
   *     plusoners - List all people who have +1'd this activity.
   *     resharers - List all people who have reshared this activity.
   *     sharedto - List all people who this activity was shared to.
   *
   * [maxResults] - The maximum number of people to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
   *   Default: 20
   *   Minimum: 1
   *   Maximum: 100
   *
   * [pageToken] - The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PeopleFeed> listByActivity(core.String activityId, core.String collection, {core.int maxResults, core.String pageToken, core.Map optParams}) {
    var url = "activities/{activityId}/people/{collection}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (activityId == null) paramErrors.add("activityId is required");
    if (activityId != null) urlParams["activityId"] = activityId;
    if (collection == null) paramErrors.add("collection is required");
    if (collection != null && !["plusoners", "resharers", "sharedto"].contains(collection)) {
      paramErrors.add("Allowed values for collection: plusoners, resharers, sharedto");
    }
    if (collection != null) urlParams["collection"] = collection;
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PeopleFeed.fromJson(data));
  }

  /**
   * List all of the people who are members of a circle.
   *
   * [circleId] - The ID of the circle to get the members of.
   *
   * [maxResults] - The maximum number of people to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
   *   Default: 20
   *   Minimum: 1
   *   Maximum: 100
   *
   * [pageToken] - The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PeopleFeed> listByCircle(core.String circleId, {core.int maxResults, core.String pageToken, core.Map optParams}) {
    var url = "circles/{circleId}/people";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (circleId == null) paramErrors.add("circleId is required");
    if (circleId != null) urlParams["circleId"] = circleId;
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PeopleFeed.fromJson(data));
  }
}

