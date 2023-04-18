import { TestBed } from '@angular/core/testing';

import { UserAuthorizedGuard } from './user-authorized.guard';

describe('UserAuthorizedGuard', () => {
  let guard: UserAuthorizedGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(UserAuthorizedGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
